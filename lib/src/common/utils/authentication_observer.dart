//язык
import 'dart:async';

//фаербейз
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

//логгер
import 'package:l/l.dart';

//утилиты
import 'package:chum2/src/common/utils/error_handler.dart';

///наблюдатель аутентифицирован пользователь или нет
///Если аутентифицирован или состояние изменилось на аутентифицированного
/// - вызывает настройку аналитики на определенного юзера
extension SettingUpAnalyticsPerUser on FirebaseAuth {
  static StreamSubscription<User?>? _subscription;

  ///подписка на стрим которая реагирует на изменения юзера и настраивает его
  ///фаербейз аналитикс и фаербейз крашлитикс на нужного юзера
  StreamSubscription<User?> observe() {
    if (_subscription != null) {
      _subscription?.cancel();
      _subscription = null;
    }

    void _onError(Object error, StackTrace stackTrace) {
      l.e('An error occurred in the SettingUpAnalyticsPerUser class in the observe function: $error',
          stackTrace);
      ErrorHandler.logError(error, stackTrace: stackTrace);
    }

    ///вызывается при изменении юзера (в стриме FirebaseAuth.instance.userChanges())
    ///настраивает аналитику на определенного юзера
    void _onAuthChanged(User? user) {
      //настраиваем фаербейз аналитикс и крашлитикс на определенного юзера
      //TODO: проверить все ли работает с неаутентифицированным юзером и убрать приватную инфу из логгера
      l.i('Assigning firebase analytics and crashlytics a unique user \r\n user Id: ${user?.uid} \r\n user name: ${user?.displayName}');
      //аналитикс
      FirebaseAnalytics.instance.setUserId(id: user?.uid);
      FirebaseAnalytics.instance
          .setUserProperty(name: 'email', value: user?.email);
      FirebaseAnalytics.instance
          .setUserProperty(name: 'name', value: user?.displayName);
      //крашлитикс
      if (user?.uid.isNotEmpty ?? false) {
        FirebaseCrashlytics.instance.setUserIdentifier(user?.uid ?? '');
      }
      if (user?.email?.isNotEmpty ?? false) {
        FirebaseCrashlytics.instance.setCustomKey('email', user?.email ?? '');
      }
    }

    try {
      _onAuthChanged(FirebaseAuth.instance.currentUser);
    } on Object catch (error, stackTrace) {
      _onError(error, stackTrace);
    }

    return _subscription = FirebaseAuth.instance.userChanges().listen(

          _onAuthChanged,
          cancelOnError: false,
          onDone: () => _subscription = null,
          onError: _onError,
        );
  }
}
