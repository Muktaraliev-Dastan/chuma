///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_svg/flutter_svg.dart';


class CloseIcon extends StatelessWidget {
  const CloseIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/product_info_screen/close.svg',
      height: 20,
      width: 20,
    );
  }
}