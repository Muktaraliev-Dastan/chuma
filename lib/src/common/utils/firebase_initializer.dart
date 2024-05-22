//фреймворк
import 'package:chum2/firebase_options.dart';
import 'package:flutter/foundation.dart';

//фаербейз библиотеки
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

//extension для firebase библиотеки
import 'package:chum2/src/common/utils/authentication_observer.dart';

//логгер
import 'package:l/l.dart';

///инициализация фаербейза с присвоением идентификаторов юзеров крашлитиксу
/// и аналитиксу
abstract class FirebaseInitializer {
  ///инициализация Фаербейза
  static Future<void> initialize() async {
    //инициализация фаербейза
    l.vvvvvv('Инициализируем Firebase');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then<void>(
      (final FirebaseApp firebaseApp) => Future.wait<void>(
        <Future<void>>[

          //TODO: протестировать аналитикс и крашлитикс в дебаг режиме
          //настройка фаербейза и крашлитики фаербейза
          //собирать автоматически данные фаербейзом в релизе
          firebaseApp.setAutomaticDataCollectionEnabled(kReleaseMode),
          firebaseApp.setAutomaticResourceManagementEnabled(kReleaseMode),

          //собирать логи крашлитики в релизе
          FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode),
        ],
      ),
    );
    //стримподписка которая настраивает аналитику и крашлитику на нужного юзера
   FirebaseAuth.instance.observe();
  }
}
