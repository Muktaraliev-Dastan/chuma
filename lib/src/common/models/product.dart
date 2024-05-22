///либы
import 'package:equatable/equatable.dart';

///другие модели
import 'product_characteristic.dart';
import 'additional_product.dart';
import 'cooking_type.dart';

class Product extends Equatable {
  final String title;
  final String description;
  final String sold;
  final String price;
  final String salePrice;
  final String pathToImage;
  final bool moi;
  final bool dacBiet;
  final bool isLiked;
  final List<ProductCharacteristic> characteristics;
  final List<CookingType> cookingTypes;
  final List<AdditionalProduct> additionalProducts;

  const Product({
    required this.title,
    required this.description,
    required this.sold,
    required this.price,
    required this.salePrice,
    required this.pathToImage,
    required this.moi,
    required this.dacBiet,
    required this.isLiked,
    required this.characteristics,
    required this.cookingTypes,
    required this.additionalProducts,
  });

  ///определяем поля для сравнения продуктов. Сравниваем всё так как на сервере может
  ///что-то изменится и нужно чтобы сравнение объектов выдавало false с предыдущей версией
  @override
  List<Object> get props => [
        title,
        description,
        sold,
        price,
        salePrice,
        pathToImage,
        moi,
        dacBiet,
        isLiked,
        characteristics,
        cookingTypes,
        additionalProducts
      ];

  ///функция для копирования продукта с нужными изменениями
  ///Может понадобится в будущем
  Product copyWith({
    String? title,
    String? description,
    String? sold,
    String? price,
    String? salePrice,
    String? pathToImage,
    bool? moi,
    bool? dacBiet,
    bool? isLiked,
    List<ProductCharacteristic>? characteristics,
    List<CookingType>? cookingTypes,
    List<AdditionalProduct>? additionalProducts,
  }) {
    return Product(
        title: title ?? this.title,
        description: description ?? this.description,
        sold: sold ?? this.sold,
        price: price ?? this.price,
        salePrice: salePrice ?? this.salePrice,
        pathToImage: pathToImage ?? this.pathToImage,
        moi: moi ?? this.moi,
        dacBiet: dacBiet ?? this.dacBiet,
        isLiked: isLiked ?? this.isLiked,
        characteristics: characteristics ?? this.characteristics,
        cookingTypes: cookingTypes ?? this.cookingTypes,
        additionalProducts: additionalProducts ?? this.additionalProducts);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Product {title: $title, price: $price }';
  }
}

const List<Product> products = [
  Product(
    title: "Cà Phê Nâu",
    description:
        'Cà phê đen cổ điển Việt Nam. Chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê. Cà phê đen cổ điển Việt Nam.  chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê',
    sold: '20k+ sold',
    price: "30.000 đ",
    salePrice: '50.000 đ',
    pathToImage: 'assets/from_server/products/ca phe nau.png',
    moi: true,
    dacBiet: true,
    isLiked: false,
    characteristics: <ProductCharacteristic>[
      ProductCharacteristic(name: 'Ngọt', amount: 3),
      ProductCharacteristic(name: 'Sức lực', amount: 2),
      ProductCharacteristic(name: 'Sanh trái', amount: 10),
    ],
    cookingTypes: <CookingType>[
      CookingType(
        name: 'Phin',
        price: 20000,
        pathToImage: 'assets/from_server/cooking_types/phin_icon.svg',
        isSelected: true,
      ),
      CookingType(
        name: 'Máy',
        price: 30000,
        pathToImage: 'assets/from_server/cooking_types/machine_icon.svg',
        isSelected: false,
      ),
      CookingType(
        name: 'Coldbrew',
        price: 40000,
        pathToImage: 'assets/from_server/cooking_types/coldbrew_icon.svg',
        isSelected: false,
      ),
      CookingType(
        name: 'V60',
        price: 55000,
        pathToImage: 'assets/from_server/cooking_types/v_60_hario_icon.svg',
        isSelected: false,
      ),
    ],
    additionalProducts: [
      AdditionalProduct(
        title: 'Thạch Lá Nếp',
        price: 5000,
        pathToImage: 'assets/from_server/additional_products/ap1.png',
        quantity: 2,
      ),
      AdditionalProduct(
        title: 'Thạch Nha Đam',
        price: 7000,
        pathToImage: 'assets/from_server/additional_products/ap2.png',
        quantity: 0,
      ),
      AdditionalProduct(
        title: 'Thạch Dừa Sợi',
        price: 6000,
        pathToImage: 'assets/from_server/additional_products/ap3.png',
        quantity: 1,
      ),
      AdditionalProduct(
        title: 'Trân Châu Ngọc Trai',
        price: 7000,
        pathToImage: 'assets/from_server/additional_products/ap4.png',
        quantity: 0,
      ),
    ],
  ),
  Product(
    title: "Caramen hoa quả",
    description:
        'Cà phê đen cổ điển Việt Nam. Chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê. Cà phê đen cổ điển Việt Nam.  chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê',
    sold: '900+ sold',
    price: "45.000 đ",
    salePrice: '60.000 đ',
    pathToImage: 'assets/from_server/products/caramen.png',
    moi: false,
    dacBiet: false,
    isLiked: false,
    characteristics: [
      ProductCharacteristic(name: 'Ngọt', amount: 7),
      ProductCharacteristic(name: 'Sức lực', amount: 1),
      ProductCharacteristic(name: 'Sanh trái', amount: 12),
    ],
    cookingTypes: [],
    additionalProducts: [
      AdditionalProduct(
        title: 'Thạch Lá Nếp',
        price: 5000,
        pathToImage: 'assets/from_server/additional_products/ap1.png',
        quantity: 1,
      ),
      AdditionalProduct(
        title: 'Thạch Nha Đam',
        price: 7000,
        pathToImage: 'assets/from_server/additional_products/ap2.png',
        quantity: 1,
      ),
      AdditionalProduct(
        title: 'Thạch Dừa Sợi',
        price: 6000,
        pathToImage: 'assets/from_server/additional_products/ap3.png',
        quantity: 0,
      ),
    ],
  ),
  Product(
    title: "Strawberry lemonade",
    description:
        'Cà phê đen cổ điển Việt Nam. Chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê. Cà phê đen cổ điển Việt Nam.  chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê',
    sold: '300+ sold',
    price: "45.000 đ",
    salePrice: '',
    pathToImage: 'assets/from_server/products/Strawberry lemonade.png',
    moi: true,
    dacBiet: true,
    isLiked: true,
    characteristics: [],
    cookingTypes: [],
    additionalProducts: [],
  ),
  Product(
    title: "Cà Phê Đen Đá Sài Gòn",
    description:
        'Cà phê đen cổ điển Việt Nam. Chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê. Cà phê đen cổ điển Việt Nam.  chọn một trong hai tùy chọn: nấu qua bộ lọc hoặc máy pha cà phê',
    sold: '999+ sold',
    price: "30.000 đ",
    salePrice: '35.000 đ',
    pathToImage: 'assets/from_server/products/ca phe den.png',
    moi: true,
    dacBiet: false,
    isLiked: false,
    characteristics: [
      ProductCharacteristic(name: 'Ngọt', amount: 1),
      ProductCharacteristic(name: 'Sanh trái', amount: 6),
    ],
    cookingTypes: <CookingType>[
      CookingType(
        name: 'Phin',
        price: 20000,
        pathToImage: 'assets/from_server/cooking_types/phin_icon.svg',
        isSelected: false,
      ),
      CookingType(
        name: 'Máy',
        price: 30000,
        pathToImage: 'assets/from_server/cooking_types/machine_icon.svg',
        isSelected: false,
      ),
      CookingType(
        name: 'Coldbrew',
        price: 40000,
        pathToImage: 'assets/from_server/cooking_types/coldbrew_icon.svg',
        isSelected: true,
      ),
      CookingType(
        name: 'V60',
        price: 55000,
        pathToImage: 'assets/from_server/cooking_types/v_60_hario_icon.svg',
        isSelected: false,
      ),
    ],
    additionalProducts: [],
  ),
];
