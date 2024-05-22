///модель юзера
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String pathToImage;
  final List<UserAddress> userAddresses;
  final String moneySpend;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.pathToImage,
    required this.userAddresses,
    required this.moneySpend,
  });
}

class UserAddress {
  final TypeUserAddress typeUserAddress;
  final String addressFromMap;
  final String locationOrBuildingOrFloor;
  final String landmarkOrGate;
  final String note;

  const UserAddress({
    required this.typeUserAddress,
    required this.addressFromMap,
    required this.locationOrBuildingOrFloor,
    required this.landmarkOrGate,
    required this.note,
  });
}

enum TypeUserAddress { home, work, other }

UserEntity user = const UserEntity(
  id: 495241,
  name: 'Cuong Chum',
  email: 'st.kosenkov@gmail.com',
  phoneNumber: '0905245929',
  pathToImage: '',
  userAddresses: [
    UserAddress(
      typeUserAddress: TypeUserAddress.home,
      addressFromMap:
          '8 Van Cao, Dong Quang, Thanh pho Thai Nguyen, Thai Nguyen, Vietnam',
      locationOrBuildingOrFloor: '4th floor',
      landmarkOrGate: 'first gate',
      note: 'please be as fast as possible',
    ),
  ],
  moneySpend: '9.999.899.000 đ',
);
