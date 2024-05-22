//фреймворк
import 'dart:async';

//библиотеки
import 'package:dio/dio.dart';
import 'package:l/l.dart';

//утилиты
import 'package:chum2/src/common/utils/dio_client.dart';

//модель юзера
import '../model/user_entity.dart';

abstract class IAuthenticationDataProvider {


  ///первое действие при регистрации юзера
  ///Если юзера нет на бэке - сохраняет нового юзера на бэке и возвращает его
  ///Если юзер есть на бэке - просто возвращает его
  Future<UserEntity> storeUser();

  ///Получает юзера с бэка
  Future<UserEntity> getUser();
}

class AuthenticationDataProviderImpl implements IAuthenticationDataProvider {
  final Dio _dio = DioClient().dio;

  @override
  Future<UserEntity> storeUser() async {
    l.i('выполняется storeUser() из AuthenticationDataProviderImpl');
    //TODO: обработка ошибок
    final response = await _dio.post('/api/v1/user/store');
    l.i('storeUser() успешно выполнен, возвращаем юзера');
    UserEntity user = AuthenticatedUser.fromJson(response.data);
    return user;
  }

  @override
  Future<UserEntity> getUser() async {
    //TODO: дописать чтобы возвращал неатентифицированного пользователя если юзера юзера нет в стриме фаербейза
    l.i('выполняется getUser() из AuthenticationDataProviderImpl');
    //TODO: обработка ошибок
    final response = await _dio.get('/api/v1/user/get-user');
    l.i('getUser() из AuthenticationDataProviderImpl успешно выполнен, возвращаем юзера');
    UserEntity user = AuthenticatedUser.fromJson(response.data);
    l.i('getUser() из AuthenticationDataProviderImpl успешно выполнен, возвращаем юзера $user');
    return user;
  }
}

// final response = await _dio.get('/api/v1/user/get-user');
