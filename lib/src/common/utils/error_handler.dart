//фреймворк
import 'package:flutter/foundation.dart';

//либы
import 'package:l/l.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

abstract class ErrorHandler {
  //TODO: подумать над возможностью более гранулярного логгирования ошибок
  //как у FOX-а в dart_jobs
  //(если исключение = стринга и нет обозначения warning=true или нет стектрейса
  //то ошибку не записываем с помощью recordError а просто логгируем)

  //TODO: чекнуть правильно ли я ловлю ошибки в самом ErrorHandler
  //подозрение что неправильно так как при отсутствии интернета получим только
  //логи которые тоже не отправятся. Протестировать с отсутствием интернета

  ///логгирование ошибки
  static void logError(Object error, {StackTrace? stackTrace, String? hint}) async {
    try {
      await FirebaseCrashlytics.instance
          .recordError(error, stackTrace ?? StackTrace.current, reason: hint);
    } on Object catch (exception, stackTrace) {
      l.e('Exception $exception in ErrorHandler.recordError', stackTrace);
    }
  }

  ///логгирование сообщения
  static void logMessage(String message,
      {StackTrace? stackTrace, String? hint}) async {
    try {
      await FirebaseCrashlytics.instance
          .log('$message${hint != null ? '\r\n$hint' : ''}');
    } on Object catch (exception, stackTrace) {
      l.e('Exception $exception in ErrorHandler.recordError', stackTrace);
    }
  }

  ///первый перехват ошибок фреймворка и помещение их в логгер (без помещения в
  ///в крашлитикс так как крашлитикс еще не инициализирован
  static void overrideFlutterErrorWithLogger(
      FlutterExceptionHandler? sourceFlutterError) {
    FlutterError.onError = (final FlutterErrorDetails details) {
      l.w(details.exceptionAsString(), details.stack);
      sourceFlutterError?.call(details);
    };
  }

  ///второй перехват ошибок фреймворка и помещение их в логгер и крашлитикс
  static void overrideFlutterErrorWithLoggerAndCrashlytics(
      FlutterExceptionHandler? sourceFlutterError) {
    FlutterError.onError = (final FlutterErrorDetails details) {
      l.w(details.exceptionAsString(), details.stack);
      FirebaseCrashlytics.instance.recordFlutterError(details);
      sourceFlutterError?.call(details);
    };
  }

  ///отправить ошибки логгера l в crashlytics в релиз моде
  static void sendLoggerErrorToCrashlytics() {
    if (kReleaseMode) {
      l
          .where(
            (final msg) => msg.level.maybeWhen(
              error: () => true,
              warning: () => true,
              shout: () => true,
              orElse: () => false,
            ),
          )
          .map<String>((msg) => msg.message.toString())
          .listen(FirebaseCrashlytics.instance.log);
    }
  }
}
