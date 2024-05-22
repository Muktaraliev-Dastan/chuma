///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:figma_squircle/figma_squircle.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithSales extends StatelessWidget {
  const CarouselWithSales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> promoLinks = const <String>[
      'assets/from_server/promo/banner1.jpg',
      'assets/from_server/promo/banner2.jpg',
      'assets/from_server/promo/banner3.jpg',
      'assets/from_server/promo/banner4.jpg',
      'assets/from_server/promo/banner5.jpg',
    ];



    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        enlargeCenterPage: true,

        ///TODO: разобраться как правильно задать ширину CarouselSlider
        ///пока захардкодена цифра 32 вместо 40. Должно быть 40 так как паддинги
        ///по 20
        viewportFraction: MediaQuery.of(context).size.height /
            (MediaQuery.of(context).size.height +
                32 * WidgetsBinding.instance!.window.devicePixelRatio),
        autoPlayCurve: Curves.easeInOut,
      ),
      items: promoLinks.map((imageLocation) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ClipSmoothRect(
            radius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 1,
            ),
            child: Image.asset(
              imageLocation,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}
