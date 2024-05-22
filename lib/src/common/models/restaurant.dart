///модель любого заведения
class Restaurant {
  final String name;
  final String location;
  final String address;
  final String pathToImage;
  final TypeOfRestaurant typeOfRestaurant;

  const Restaurant({
    required this.name,
    required this.location,
    required this.address,
    required this.pathToImage,
    required this.typeOfRestaurant,
  });
}

enum TypeOfRestaurant {cafe, restaurant}

const List<Restaurant> existingRestaurants = [
  Restaurant(
    name: 'Chum Ca Phe',
    location: 'ngõ 25 Phù Liễn, Hàng Văn Thụ0, Thành phố Thái Nguyên',
    address: 'ngõ 25 Phù Liễn, Hàng Văn Thụ0, Thành phố Thái Nguyên',
    pathToImage: 'assets/from_server/shops/1111.png',
    typeOfRestaurant: TypeOfRestaurant.cafe,
  ),
  Restaurant(
    name: 'Chum Cofee No.3',
    location: '07 Đê Nông Lâm, Quang Trung, Thành phố Thái Nguyên',
    address: '07 Đê Nông Lâm, Quang Trung, Thành phố Thái Nguyên',
    pathToImage: 'assets/from_server/shops/2222.png',
    typeOfRestaurant: TypeOfRestaurant.cafe,
  ),
  Restaurant(
    name: 'Chum Cofee No.4',
    location: 'Ngõ 70, B34, Phố Nguyễn Thị Định, Trung Hoà, Thanh Xuân',
    address: 'Ngõ 70, B34, Phố Nguyễn Thị Định, Trung Hoà, Thanh Xuân',
    pathToImage: 'assets/from_server/shops/3333.png',
    typeOfRestaurant: TypeOfRestaurant.cafe,
  ),
  Restaurant(
    name: 'Xuong Ca Phe',
    location: 'Số 62 Phù Liễn, Hàng Văn Thụ0, Thành phố Thái Nguyên',
    address: 'Số 62 Phù Liễn, Hàng Văn Thụ0, Thành phố Thái Nguyên',
    pathToImage: 'assets/from_server/shops/4444.png',
    typeOfRestaurant: TypeOfRestaurant.restaurant,
  ),
];
