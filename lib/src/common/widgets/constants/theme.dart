// Open Flutter E-commerce Light Theme
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';

class AppSizes {
  ///отступы
  static const EdgeInsets paddingAppBar =
      EdgeInsets.symmetric(horizontal: 20, vertical: 0);
  static const EdgeInsets marginElements =
      EdgeInsets.symmetric(horizontal: 20, vertical: 0);
  static const EdgeInsets marginShortOrderCards =
  EdgeInsets.only(top: 10,bottom: 20,left: 20,right: 20);
  static const EdgeInsets marginProductCard =
      EdgeInsets.fromLTRB(20, 25, 20, 10);
  static const EdgeInsets paddingTypeOfDeliveryCard =
      EdgeInsets.symmetric(vertical: 10, horizontal: 0);
  static const EdgeInsets marginProductInfoCard =
      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 0);


  static const BoxShadow boxShadowForCards = BoxShadow(
    color: Color(0x66C4C4C4),
    spreadRadius: 0,
    blurRadius: 15,
    offset: Offset(0, 4),
  );
  static const BoxShadow boxShadowForCategories = BoxShadow(
    color: Color(0x33321313),
    spreadRadius: 0,
    blurRadius: 25,
    offset: Offset(0, 4),
  );

  ///нижние кнопки открытой карточки товара
  static const BoxShadow boxShadowForButtons = BoxShadow(
    color: Color(0x33321313),
    spreadRadius: 0,
    blurRadius: 15,
    offset: Offset(0, 4),
  );

  ///кнопка выбора типа приготовления в открытой карточке продукта
  ///кнопка количества заказанных дополнительных продуктов в открытой карточке продукта
  static const BoxShadow boxShadowForIcons = BoxShadow(
    color: Color(0x4D321313),
    spreadRadius: 0,
    blurRadius: 7,
    offset: Offset(0, 4),
  );

  static const BoxShadow boxShadowForSale = BoxShadow(
    color: Color(0x4DF05322),
    spreadRadius: 0,
    blurRadius: 25,
    offset: Offset(0, 4),
  );

  static const BoxShadow boxShadowForBadges = BoxShadow(
    color: Color(0x4DF0C23A),
    spreadRadius: 0,
    blurRadius: 18.86,
    offset: Offset(0, 3),
  );

  static const BoxShadow boxShadowNull = BoxShadow();

  ///ShapeBorder с углами объектов (с Smooth rounded corners)
  ///используется для основных элементов:
  /// -карточка продукта,

  ///миникарточка продукта
  ///карточка типа сервиса
  ///подробная карточка продукта
  static ShapeBorder shapeBorderForElements = SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(cornerRadius: 20, cornerSmoothing: 1));

  ///форма для кнопки снизу в открытой карточке продукта с рамкой
  static ShapeBorder shapeBorderForButtonsWithSide = SmoothRectangleBorder(
    side: const BorderSide(width: 1, color: Color(0xFF321313)),
    borderRadius: SmoothBorderRadius(cornerRadius: 10, cornerSmoothing: 1),
  );

  ///форма для кнопки снизу в открытой карточке продукта
  static ShapeBorder shapeBorderForButtons = SmoothRectangleBorder(
    borderRadius: SmoothBorderRadius(cornerRadius: 10, cornerSmoothing: 1),
  );

  static ShapeBorder shapeBorderForCharacteristicsTable = SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(cornerRadius: 2.5, cornerSmoothing: 1));

  ///углы объектов (без Smooth rounded corners)
  static BorderRadius borderRadiusForCategories = BorderRadius.circular(30);
  static BorderRadius borderRadiusForBadges = BorderRadius.circular(30);
  static BorderRadius borderRadiusForDividers = BorderRadius.circular(2);
  static BorderRadius borderRadiusForIndicator = BorderRadius.circular(5);
}

class AppCustomTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      colorScheme: const ColorScheme(
          primary: Color(0xFFFF9E2B),
          secondary: Color(0xFFCF7D36),
          surface: Color(0xFFFFFFFF),
          background: Color(0xFFFAF4F4),
          error: Color(0xFFA4101B),
          onPrimary: Color(0xFF321313),
          onSecondary: Color(0xFF321313),
          onSurface: Color(0xFF321313),
          onBackground: Color(0xFF9F9F9F),
          onError: Color(0xFFA4101B),
          brightness: Brightness.light),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFFFF9E2B),
        unselectedItemColor: Color(0xFF9F9F9F),
        backgroundColor: Color(0xFFFAF4F4),
        elevation: 0,
        enableFeedback: true,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.06,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.06,
        ),
      ),
      textTheme: const TextTheme(
        ///название продукта в карточке продукта
        ///лейбл для категорий на главной странице
        headline1: TextStyle(
          color: Color(0xFF321313),
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),

        headline2: TextStyle(
          // height: 1,
          color: Color(0xFF321313),
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),

        ///название в карточке продукта
        ///название категорий
        ///название типов доставки в карточке типов доставки
        ///адрес ресторана на странице ресторана

        headline3: TextStyle(
          color: Color(0xFF321313),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),

        ///большие бейджы продукта в открытой карточке продукта
        ///лейблы блока "Дополнительные продукты" и "типы приготовления"
        ///в открытой карточке продукта
        ///количество дополнительных продуктов в открытой карточке продукта
        ///тип сервиса в открытой карточке заказа
        ///назваие ресторана на странице ресторана
        headline4: TextStyle(
          color: Color(0xFF321313),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),

        ///используется для sale и маленьких бейджев продукта
        headline5: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 12,
          letterSpacing: -0.3,
          fontWeight: FontWeight.w500,
        ),

        ///текст локации в аппбаре
        ///кнопка "открыть все категории"
        ///название характеристик продукта
        ///название типов приготовления
        ///название дополнительных продуктов
        ///нижние кнопки в открытой карточке продукта
        ///табы "активные" и "история" экрана заказов
        ///статус заказа в миникарточке заказа
        ///тип сервиса в миникарточке заказа
        ///Цена в миникарточке заказа
        headline6: TextStyle(
          color: Color(0xFF321313),
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),

        ///описание продукта в открытой карточке


        bodyText1: TextStyle(
          color: Color(0xFF656565),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        ///текст в миникарточке заказа
        bodyText2: TextStyle(
          color: Color(0xFF321313),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),

        subtitle1: TextStyle(
          color: Color(0xFF656565),
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
        ),

        ///зачеркнутый текст старой цены на главной и в карточке продукта
        subtitle2: TextStyle(
          color: Color(0xFF656565),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.lineThrough,
        ),
      ),

      // appBarTheme: theme.appBarTheme.copyWith(
      //     color: AppColors.background,
      //     iconTheme: const IconThemeData(color: AppColors.black),
      //     textTheme: theme.textTheme.copyWith(
      //         caption: const TextStyle(
      //             color: AppColors.black,
      //             fontSize: 18,
      //             fontFamily: 'Metropolis',
      //             fontWeight: FontWeight.w400))),

      // textTheme: theme.textTheme
      //     .copyWith(
      //       //over image white text
      //       headline: theme.textTheme.headline.copyWith(
      //           fontSize: 48,
      //           color: AppColors.white,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w900),
      //       title: theme.textTheme.title.copyWith(
      //           fontSize: 24,
      //           color: AppColors.black,
      //           fontWeight: FontWeight.w900,
      //           fontFamily: 'Metropolis'),
      //       //
      //
      //       //product title
      //       display1: theme.textTheme.display1.copyWith(
      //           color: AppColors.black,
      //           fontSize: 16,
      //           fontWeight: FontWeight.w400,
      //           fontFamily: 'Metropolis'),
      //
      //       display2: theme.textTheme.display2.copyWith(
      //           fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
      //       //product price
      //       display3: theme.textTheme.display3.copyWith(
      //           color: AppColors.lightGray,
      //           fontSize: 14,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w400),
      //       display4: theme.textTheme.display4.copyWith(
      //           fontFamily: 'Metropolis', fontWeight: FontWeight.w500),
      //
      //       subtitle: theme.textTheme.headline.copyWith(
      //           fontSize: 18,
      //           color: AppColors.black,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w400),
      //       subhead: theme.textTheme.headline.copyWith(
      //           fontSize: 24,
      //           color: AppColors.darkGray,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w500),
      //       //red button with white text
      //       button: theme.textTheme.button.copyWith(
      //           fontSize: 14,
      //           color: AppColors.white,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w500),
      //       //black caption title
      //       caption: theme.textTheme.caption.copyWith(
      //           fontSize: 34,
      //           color: AppColors.black,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w700),
      //       //light gray small text
      //       body1: theme.textTheme.body1.copyWith(
      //           color: AppColors.lightGray,
      //           fontSize: 11,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w400),
      //       //view all link
      //       body2: theme.textTheme.body2.copyWith(
      //           color: AppColors.black,
      //           fontSize: 11,
      //           fontFamily: 'Metropolis',
      //           fontWeight: FontWeight.w400),
      //     )
      //     .apply(fontFamily: 'Metropolis'),

      // buttonTheme: theme.buttonTheme.copyWith(
      //   minWidth: 50,
      //   buttonColor: AppColors.red,
      // ),
    );
  }
}

// static const int splashScreenTitleFontSize = 48;
// static const int titleFontSize = 34;
// static const double sidePadding = 15;
// static const double widgetSidePadding = 20;
// static const double buttonRadius = 25;
// static const double imageRadius = 8;
// static const double linePadding = 4;
// static const double widgetBorderRadius = 34;
// static const double textFieldRadius = 4.0;
// static const EdgeInsets bottomSheetPadding =
//     EdgeInsets.symmetric(horizontal: 16, vertical: 10);
// static const app_bar_size = 56.0;
// static const app_bar_expanded_size = 180.0;
// static const tile_width = 148.0;
// static const tile_height = 276.0;

// class AppColors {
//   static const background = Color(0xFFFAF4F4);
//   static const black = Color(0xFF321313);
//   static const lightGray = Color(0xFF9B9B9B);
//   static const darkGray = Color(0xFF979797);
//   static const white = Color(0xFFFFFFFF);
//   static const orange = Color(0xFFFFBA49);
//   static const background = Color(0xFFE5E5E5);
//   static const backgroundLight = Color(0xFFF9F9F9);
//   static const transparent = Color(0x00000000);
//   static const success = Color(0xFF2AA952);
//   static const green = Color(0xFF2AA952);
// }

// class AppConsts {
//   static const page_size = 20;
// }

// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
