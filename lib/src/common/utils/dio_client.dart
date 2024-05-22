//фреймворк
import 'dart:async';

//библиотеки
import 'package:dio/dio.dart';
import 'package:l/l.dart';
import 'package:firebase_auth/firebase_auth.dart';

//утилиты
import 'package:chum2/src/common/utils/error_handler.dart';

///Dio-клиент с обновляющимся внутри себя токеном
///Синглтон
class DioClient {
  static final DioClient _dioClient = DioClient._internal();

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal();

  ///Dio клиент
  final Dio dio = Dio();

  ///урл сервака
  final _baseUrl = 'https://9b26-94-143-197-197.ngrok.io';

  ///иницилаизируем клиент, присваиваем ему URL сервака и интерцептор который
  ///перехватывает запрос и добавляет токен
  Future<void> initClient() async {
    dio.interceptors.clear();
    dio.options.baseUrl = _baseUrl;
    dio.interceptors.add(AppInterceptor());
  }
}

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  //вставляет в хедер каждого запроса актуальный FirebaseTokenId или же
  //Unauthenticated user
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    var firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      ///TODO: внедрить обработку ошибок для получения firebaseTokenID
      // String firebaseIdToken =
      //     await FirebaseAuth.instance.currentUser!.getIdToken();
      // options.headers['Authorization'] = 'Bearer $firebaseIdToken';
      // l.i('Сработал AppInterceptor. пользователь залогинен в фаербейзе '
      //     'присваиваем Authorization хедеру хттп-клиента фаербейз токен');
    } else {
      options.headers['Authorization'] = 'Unauthenticated user';
      l.i('Сработал AppInterceptor. пользователь не залогинен в фаербейзе '
          'присваиваем Authorization хедеру хттп-клиента Unauthenticated user');
    }
    super.onRequest(options, handler);
  }
}

///Старый Dio-клиент со стримом
///из-за асинхронности не успевает обновить токен от фаербейза в хедере
///во время авторизации
// class DioClient {
//   static final DioClient _dioClient = DioClient._internal();
//
//   factory DioClient() {
//     return _dioClient;
//   }
//
//   DioClient._internal();
//
//   ///Dio клиент
//   final Dio dio = Dio();
//
//   ///урл сервака
//   final _baseUrl = 'https://c1b7-193-34-225-72.ngrok.io';
//
//   ///внутренняя nullable подписка которая используется для работы observe
//   StreamSubscription<User?>? _subscription;
//
//   ///подписка которая добавляет свежий токен фаербейза в Dio клиент [dio]
//   ///и настраивает [_baseUrl]. Возвращает подписку на стрим FireAuth, которая
//   ///меняет токен когда он обновился
//   Future<StreamSubscription<User?>> initialStream() async {
//     if (_subscription != null) {
//       _subscription?.cancel();
//       _subscription = null;
//     }
//
//     void _onError(Object error, StackTrace stackTrace) {
//       l.e('An error occurred in the DioClient class in the dioClientInitStream function: $error',
//           stackTrace);
//       ErrorHandler.logError(error, stackTrace: stackTrace);
//     }
//
//     ///вызывается при изменении юзера (в стриме FirebaseAuth.instance.userChanges())
//     ///настраивает нужный токен Dio клиенту
//     Future<void> _onAuthChanged(User? user) async {
//       //TODO: протестировать что отрабатывает когда нет аутентифицированного юзера
//       l.i('присваиваем новый токен Dio клиенту так как произошел запуск приложения или фаербейз токен сменился');
//       if (user != null) {
//         // String firebaseIdToken = await FirebaseAuth.instance.currentUser!.getIdToken();
//         String firebaseIdToken = await user.getIdToken();
//         dio.options.headers['Authorization'] = 'Bearer $firebaseIdToken';
//       } else {
//         dio.options.headers['Authorization'] = 'Unauthenticated user';
//       }
//     }
//
//     try {
//       //настройка Dio клиента
//       dio.options.baseUrl = _baseUrl;
//       await _onAuthChanged(FirebaseAuth.instance.currentUser);
//     } on Object catch (error, stackTrace) {
//       _onError(error, stackTrace);
//     }
//
//     return _subscription = FirebaseAuth.instance.userChanges().listen(
//         _onAuthChanged,
//         cancelOnError: false,
//         onDone: () => _subscription = null,
//         onError: _onError);
//   }
// }
