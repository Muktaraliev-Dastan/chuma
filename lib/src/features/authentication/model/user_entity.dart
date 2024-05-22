//фреймворк
import 'package:meta/meta.dart';

//котогенерация
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

///сущность юзера
@immutable
abstract class UserEntity {
  bool get isAuthenticated;

  bool get isNotAuthenticated;

  AuthenticatedUser? get authenticatedOrNull;

  @literal
  const factory UserEntity.notAuthenticated() = NotAuthenticatedUser;

  const factory UserEntity.authenticated({
    required final String id,
    required final String name,
    required final String phoneNumber,
    required final String pictureURL,
    required final int moneySpend,
    required final List<UserAddress> addresses,
    required final bool isNew,
  }) = AuthenticatedUser;

  T when<T extends Object?>(
      {required final T Function(AuthenticatedUser user) authenticated,
      required final T Function() notAuthenticated});
}

class NotAuthenticatedUser implements UserEntity {
  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => true;

  @override
  AuthenticatedUser? get authenticatedOrNull => null;

  const NotAuthenticatedUser();

  @override
  T when<T extends Object?>(
          {required final T Function(AuthenticatedUser user) authenticated,
          required final T Function() notAuthenticated}) =>
      notAuthenticated();

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(final Object other) => other is NotAuthenticatedUser;

  @override
  int get hashCode => 0;
}

@immutable
@JsonSerializable(
  //игнорирурем нераспознанные ключи
  disallowUnrecognizedKeys: false,
  //используем toJson из внутреннего класса
  explicitToJson: true,
)
class AuthenticatedUser implements UserEntity {
  @override
  bool get isAuthenticated => !isNotAuthenticated;

  @override
  bool get isNotAuthenticated => id.isEmpty && name.isEmpty && pictureURL.isEmpty;

  @override
  AuthenticatedUser? get authenticatedOrNull => isNotAuthenticated? null : this;

  ///id с базы данных
  final String id;

  ///имя пользователя
  final String name;

  ///номер телефона
  @JsonKey(defaultValue: '0905245929')
  final String phoneNumber;

  ///аватарка
  @JsonKey(name: 'picture')
  final String pictureURL;

  ///количество потраченных денег, используется для построения VipCard программы
  @JsonKey(defaultValue: 7000000)
  final int moneySpend;

  ///список адресов юзера для доставки
  @JsonKey(includeIfNull: true)
  final List<UserAddress> addresses;

  ///новый ли юзер. Если новый - просим ввести пароль при первой регистрации
  final bool isNew;

  const AuthenticatedUser({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.pictureURL,
    required this.moneySpend,
    required this.addresses,
    required this.isNew,
  });

  @override
  T when<T extends Object?>(
          {required final T Function(AuthenticatedUser user) authenticated,
          required final T Function() notAuthenticated}) =>
      authenticated(this);

  @override
  String toString() => 'AuthenticatedUser('
      'id: $id,'
      'name: $name)';

  @override
  bool operator ==(final Object other) =>
      other is AuthenticatedUser && id == other.id;

  @override
  int get hashCode => id.hashCode;

  factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserFromJson(json['data']);

  Map<String, dynamic> toJson() => _$AuthenticatedUserToJson(this);
}

///адрес юзера
@JsonSerializable(
  //игнорирурем нераспознанные ключи
  disallowUnrecognizedKeys: false,
)
class UserAddress {
  final int id;

  ///тип адреса - домашний, рабочий или другой
  @JsonKey(name: 'type')
  final TypeUserAddress type;
  @JsonKey(name: 'map_address')
  final String addressFromMap;

  //TODO: поменять как Серега подправит модельку
  @JsonKey(name: 'address_details')
  final String locationOrBuildingOrFloor;

  //TODO: убрать как Серега подправит модельку
  @JsonKey(name: 'label')
  final String landmarkOrGate;

  ///примечание к адресу
  final String notes;

  const UserAddress({
    required this.id,
    required this.type,
    required this.addressFromMap,
    required this.locationOrBuildingOrFloor,
    required this.landmarkOrGate,
    required this.notes,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}

enum TypeUserAddress {
  @JsonValue(0)
  home,
  @JsonValue(1)
  work,
  @JsonValue(2)
  other,
}



// UserEntity user = const UserEntity(
//   id: 495241,
//   name: 'Cuong Chum',
//   email: 'st.kosenkov@gmail.com',
//   phoneNumber: '0905245929',
//   pathToImage: '',
//   userAddresses: [
//     UserAddress(
//       typeUserAddress: TypeUserAddress.home,
//       addressFromMap:
//           '8 Van Cao, Dong Quang, Thanh pho Thai Nguyen, Thai Nguyen, Vietnam',
//       locationOrBuildingOrFloor: '4th floor',
//       landmarkOrGate: 'first gate',
//       note: 'please be as fast as possible',
//     ),
//   ],
//   moneySpend: '9.999.899.000 đ',
// );
