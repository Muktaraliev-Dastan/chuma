//фреймворк
import 'dart:async';

//Модели
import 'package:chum2/src/common/models/models.dart';

//библиотеки
import 'package:dio/dio.dart';
import 'package:l/l.dart';
import 'package:firebase_auth/firebase_auth.dart';

//утилиты
import 'package:chum2/src/common/utils/error_handler.dart';

//TODO:
///отвечает за все подключения к серверу Chum App
@Deprecated('Устаревший апи клиент, разбил на отдельные репозитории-провайдеры')
class ChumServerApiClient {
  ChumServerApiClient();

  ///урл сервака
  final _baseUrl = 'https://f17e-94-143-197-231.ngrok.io/';

  ///Dio клиент
  late Dio _dio;

  // ///внутренняя nullable подписка которая используется для работы observe
  // StreamSubscription<User?>? _subscription;

  ///подписка которая добавляет свежий токен фаербейза в Dio клиент [_dio]
  StreamSubscription<User?> observeFirebaseTokenId() {
    // if (_subscription != null) {
    //   _subscription?.cancel();
    //   _subscription = null;
    // }

    void _onError(Object error, StackTrace stackTrace) {
      l.e('An error occurred in the ChumServerApiClient class in the observeFirebaseTokenId function: $error',
          stackTrace);
      ErrorHandler.logError(error, stackTrace: stackTrace);
    }

    ///вызывается при изменении юзера (в стриме FirebaseAuth.instance.userChanges())
    ///настраивает нужный токен Dio клиенту
    void _onAuthChanged(User? user) async {
      //TODO: протестировать
      l.i('присваиваем новый токен Dio клиенту так как произошел запуск приложения или фаербейз токен сменился');
      if (user != null) {
        // String firebaseIdToken = await user.getIdToken();
        // _dio.options.headers['Authorization'] = 'Bearer $firebaseIdToken';
      } else {
        _dio.options.headers['Authorization'] = 'Unauthenticated user';
      }
    }

    try {
      _onAuthChanged(FirebaseAuth.instance.currentUser);
    } on Object catch (error, stackTrace) {
      _onError(error, stackTrace);
    }

    return FirebaseAuth.instance.userChanges().listen(
          _onAuthChanged,
          cancelOnError: false,
          onError: _onError,
        );
  }

  // return _subscription = FirebaseAuth.instance.userChanges().listen(
  //     _onAuthChanged,
  //     cancelOnError: false,
  //     onDone: () => _subscription = null,
  //     onError: _onError);

  Future<List<Product>> fetchMainPageProducts() async {
    var result = await products;
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return result;
  }
}
