///фреймворк
import 'package:flutter/material.dart';

///пакеты
import 'package:flutter_svg/flutter_svg.dart';

///модели
import 'package:chum2/src/common/models/category.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///отдельный элемент свернутого горизонтального листа категорий
class CategoryItem extends StatefulWidget {
  final Category category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Container(
      height: 56,

      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
      decoration: BoxDecoration(
        borderRadius: AppSizes.borderRadiusForCategories,
        color: widget.category.enabled
            ? _theme.colorScheme.primary
            : _theme.colorScheme.surface,
        boxShadow: [
          widget.category.enabled
              ? AppSizes.boxShadowNull
              : AppSizes.boxShadowForCards,
        ],
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: _theme.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                widget.category.pathToImage,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.category.label,
            style: _theme.textTheme.headline3,
          ),
        ],
      ),
    );
  }
}



