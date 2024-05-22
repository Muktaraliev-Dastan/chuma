//фреймворк
import 'dart:async';

//фаербейз либы
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

//либы
import 'package:l/l.dart';

//дата провайдер
import 'authentication_data_provider.dart';

//модель юзера
import '../model/user_entity.dart';

abstract class IAuthenticationRepository {
  ///выполняется когда нужно получить юзера
  ///проверяет юзера фаербейз, если он есть то запрашивает его у бэка и возвращает
  ///[AuthenticatedUser]
  ///если разавторизировано то возвращает [NotAuthenticatedUser]
  Future<UserEntity> get getUserEntity;

  ///Разлогиниться
  Future<void> logOut();

  ///Залогиниться через гугл
  Future<void> signInWithGoogle();

  ///возвращает стрим фаербейза FirebaseAuth.authStateChanges
  Stream<User?> get firebaseAuthStateChanges;
//

// ///конвертирует текущий стрим юзера firebase в UserEntity
// Stream<UserEntity> get authStateChanges;

// Future<void> signInWithFacebook();
//
// Future<void> signInWithPhone();
//
// Future<void> signInWithApple();

}

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  AuthenticationRepositoryImpl(
      {final FirebaseAuth? firebaseAuth,
      final IAuthenticationDataProvider? authenticationDataProvider})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _authenticationDataProvider =
            authenticationDataProvider ?? AuthenticationDataProviderImpl();

  final FirebaseAuth _firebaseAuth;
  final IAuthenticationDataProvider _authenticationDataProvider;

  @override
  Stream<User?> get firebaseAuthStateChanges =>
      _firebaseAuth.authStateChanges();

  @override
  Future<UserEntity> get getUserEntity async {
    try {
      l.i('выполняется getUserEntity из класса AuthenticationRepositoryImpl');
      User? firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser == null ||
          firebaseUser.isAnonymous ||
          firebaseUser.uid.isEmpty) {
        l.i('так как firebaseUser неаутентифицирован getUserEntity из класса AuthenticationRepositoryImpl возвращает UserEntity.notAuthenticated()');
        return const UserEntity.notAuthenticated();
      } else {
        UserEntity user = await _authenticationDataProvider.getUser();
        l.i('так как firebaseUser аутентифицирован getUserEntity из класса AuthenticationRepositoryImpl возвращает UserEntity.Authenticated() $user');
        return user;
      }
    } on Object catch (error, stacktrace) {
      l.w(
        'произошла ошибка в getUserEntity в AuthenticationRepositoryImpl: $error',
        stacktrace,
      );
      rethrow;
    }
    //TODO: обработка ошибок
  }

  @override
  Future<void> logOut() async {
    //TODO: добавить все способы выхода
    try {
      l.i('Выполняем  logOutInFirebase() в AuthenticationRepositoryImpl');
      await _firebaseAuth.signOut();
      await GoogleSignIn().disconnect();
      l.i('logOutInFirebase() в AuthenticationRepositoryImpl выполнен');
      //TODO: имплементировать очистку SharedPreferences
    } on Object catch (error, stacktrace) {
      //TODO: добавить обработку ошибок
      l.w(
        'произошла ошибка в logOut в AuthenticationRepositoryImpl: $error',
        stacktrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    l.i('вызван  signInWithGoogle() в AuthenticationRepositoryImpl');
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // отправляем кредсы GoogleAuthProvider в FirebaseAuth
      await _firebaseAuth.signInWithCredential(credential);
      l.i('signInWithGoogle() в AuthenticationRepositoryImpl выполнен');
    } on Object catch (error, stacktrace) {
      l.w('произошла ошибка в signInWithGoogle в AuthenticationRepositoryImpl: $error',
          stacktrace);
      rethrow;
    }
  }

  // Stream<UserEntity> get authStateChanges =>
  //     _firebaseAuth.authStateChanges().asyncMap<UserEntity>((User? user) async {
  //       l.i('стрим authStateChanges из репозитория аутентификации стригерился на изменение юзера');
  //       UserEntity userEntity;
  //       if (user == null ||
  //           user.isAnonymous ||
  //           user.uid.isEmpty ||
  //           user.displayName == null) {
  //         userEntity = const NotAuthenticatedUser();
  //         l.i('стрим authStateChanges из репозитория аутентификации присвоил NotAuthenticatedUser() переменной userEntity');
  //       } else {
  //         l.i('стрим authStateChanges из репозитория аутентификации сделал запрос AuthenticationDataProviderImpl.getUser');
  //         userEntity = await _authenticationDataProvider.getUser();
  //         l.i('стрим authStateChanges из репозитория аутентификации присвоил userEntity: ${userEntity.toString()}');
  //       }
  //       l.i('стрим authStateChanges из репозитория аутентификации вернул userEntity: ${userEntity.toString()}');
  //       return userEntity;
  //     });
}
