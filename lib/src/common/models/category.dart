///модель категорий
class Category {
  final String label;
  final String pathToImage;
  final bool enabled;
  final CategoryType type;

  const Category({
    required this.label,
    required this.pathToImage,
    required this.enabled,
    required this.type,
  });
}

enum CategoryType {cafe, restaurant}
