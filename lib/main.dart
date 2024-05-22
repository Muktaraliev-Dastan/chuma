//фреймворк
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//либы
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:l/l.dart';

//само приложение для запуска
import 'package:chum2/src/app.dart';

//блок обсервер
import 'package:chum2/src/common/bloc/app_bloc_observer.dart';

//утилиты
import 'package:chum2/src/common/utils/error_handler.dart';
import 'package:chum2/src/common/utils/firebase_initializer.dart';
import 'package:chum2/src/common/utils/dio_client.dart';

//точка входа, подключаем логгер. Логгер от фокса, удобочитаемее отображает
//ошибки, умеет отправлять ошибки в крашлитикс через стрим
void main() => l.capture<void>(
      () => _appRunner(),
      const LogOptions(
        outputInRelease: false,
        messageFormatting: _messageFormatting,
        handlePrint: true,
      ),
    );

///Раннер приложения
///Инициализация библиотек, защищенной зоны, блокобсервера и всего остального
///что идет непосрдественно до инициалцзиии приложения
void _appRunner() => runZonedGuarded<Future<void>>(
      () async {
        // приложение инициализируется здесь
        l.i('Application launch');

        //запуск таймера просчета времени инициализации
        final stopwatchBeforeRunApp = Stopwatch()..start();

        // Отправка ошибок фреймворка в логгер через переопределение
        // FlutterError.onError
        ErrorHandler.overrideFlutterErrorWithLogger(FlutterError.onError);

        //инициализация WidgetsBinding
        WidgetsFlutterBinding.ensureInitialized();
        final ensureInitializedMs = stopwatchBeforeRunApp.elapsedMilliseconds;

        //Инициализация Фаербейза
        await FirebaseInitializer.initialize();
        final firebaseMs =
            stopwatchBeforeRunApp.elapsedMilliseconds - ensureInitializedMs;

        //второй раз переопределяем ошибки фреймворка и отправляем их
        //в логгер и в крашлитикс
        ErrorHandler.overrideFlutterErrorWithLoggerAndCrashlytics(
            FlutterError.onError);

        //отправляем все ошибки логгера в крашлитикс
        ErrorHandler.sendLoggerErrorToCrashlytics();

        //начинаем стрим клиента Dio(хттп), который настраивает клиент под
        //под нужный URL и прописывает токен фаербейза в запросы
        await DioClient().initClient();

        //подключаем BlocObserver
        await BlocOverrides.runZoned(
          () async {
            //инициализация приложения после инициализации всех сторонних библиотек
            //и настроек
            runApp(const App());
          },
          //Наблюдатель ивентов блока
          blocObserver: AppBlocObserver(),

          //Ивенты обрабатываются последовательно если в настройке блока не задано иначе
          eventTransformer: bloc_concurrency.sequential<Object?>(),
        );

        //останавливаем таймер
        final elapsedMilliseconds =
            (stopwatchBeforeRunApp..stop()).elapsedMilliseconds;
        final initMessage =
            'инициализация приложения заняла: $elapsedMilliseconds мс\n'
            'инициализация WidgetsBinding заняла: $ensureInitializedMs мс\n'
            'Инициализация Firebase заняла: $firebaseMs мс';

        //если дебагмод или профайл мод - пишем информацию сколько времени заняла инициализация
        if (kDebugMode || kProfileMode) {
          l.i(initMessage);
        }
        //если релизмод и время инициализации приложения больше 5 секунд -
        //делаем варнинг который уходит в крашлитикс
        else if (kReleaseMode &&
            stopwatchBeforeRunApp.elapsedMilliseconds > 5000) {
          l.w(initMessage);
        }
      },
      //перехватываем top-level error
      (final Object error, final StackTrace stackTrace) {
        //помещаем ошибку в логгер
        l.e('TOP LEVEL EXCEPTION \r\n', stackTrace);
        //отправить репорт в крашлитикс
        ErrorHandler.logError(error,
            stackTrace: stackTrace, hint: 'TOP LEVEL EXCEPTION');
      },
    );

///настройка логгера
Object _messageFormatting(
        Object message, LogLevel logLevel, DateTime dateTime) =>
    '${dateTime.hour.toString().padLeft(2, '0')}:'
    '${dateTime.minute.toString().padLeft(2, '0')}:'
    '${dateTime.second.toString().padLeft(2, '0')} '
    '$message';
