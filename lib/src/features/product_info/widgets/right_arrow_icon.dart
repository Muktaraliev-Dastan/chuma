///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_svg/flutter_svg.dart';

class RightArrowIcon extends StatelessWidget {
  const RightArrowIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/product_info_screen/right_arrow.svg',
    );
  }
}
