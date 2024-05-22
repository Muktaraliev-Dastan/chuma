///модель типа приготовления
class CookingType {
  final String name;
  final int price;
  final String pathToImage;
  final bool isSelected;

  const CookingType({
    required this.name,
    required this.price,
    required this.pathToImage,
    required this.isSelected,
  });
}
