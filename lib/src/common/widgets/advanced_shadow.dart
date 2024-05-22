///фреймворк
import 'package:flutter/material.dart';
import 'dart:ui';

/// Использую вместо обычных теней так как большинство продуктов нестандартного
/// размера и не вписываются в material. Подбирал на глаз.

class ShadowForIconsAndSmallImages extends StatelessWidget {
  final Widget child;

  const ShadowForIconsAndSmallImages({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedShadow(
        opacity: 0.25,
        offset: const Offset(0, 4),
        color: const Color(0xFF321313),
        sigma: 4,
        child: child);
  }
}

class ShadowForCardPicture extends StatelessWidget {
  final Widget child;

  const ShadowForCardPicture({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvancedShadow(
        opacity: 0.15,
        color: const Color(0xFF321313),
        offset: const Offset(0, 11),
        sigma: 16.5,
        child: child);
  }
}


class AdvancedShadow extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double sigma;
  final Color color;
  final Offset offset;

  const AdvancedShadow({
    Key? key,
    required this.child,
    this.opacity = 0.5,
    this.sigma = 2,
    this.color = Colors.black,
    this.offset = const Offset(2, 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
                sigmaY: sigma, sigmaX: sigma, tileMode: TileMode.decal),
            child: Opacity(
              opacity: opacity,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                child: child,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}

///работающий вариант, поменял
//               border: Border.all(
//                   color: Colors.transparent,
//                   width: 0,
///на
///              decoration: const BoxDecoration(
//                 border: Border.fromBorderSide(
//                     BorderSide(color: Colors.transparent)),
//               )

// class SimpleShadow extends StatelessWidget {
//   final Widget child;
//   final double opacity;
//   final double sigma;
//   final Color color;
//   final Offset offset;
//
//   const SimpleShadow({
//     Key? key,
//     required this.child,
//     this.opacity = 0.5,
//     this.sigma = 2,
//     this.color = Colors.black,
//     this.offset = const Offset(2, 2),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Transform.translate(
//           offset: offset,
//           child: ImageFiltered(
//             imageFilter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
//             child: Container(
//               decoration: const BoxDecoration(
//                 border: Border.fromBorderSide(
//                     BorderSide(color: Colors.transparent)),
//               ),
//               child: Opacity(
//                 opacity: opacity,
//                 child: ColorFiltered(
//                   colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
//                   child: child,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         child,
//       ],
//     );
//   }
// }

///оригинальный вариант из пакета
///не работает из-за                 border: Border.all(
//                   color: Colors.transparent,
//                   width: 0,
class SimpleShadowOriginal extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double sigma;
  final Color color;
  final Offset offset;

  const SimpleShadowOriginal({
    Key? key,
    required this.child,
    this.opacity = 0.5,
    this.sigma = 2,
    this.color = Colors.black,
    this.offset = const Offset(2, 2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
              child: Opacity(
                opacity: opacity,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
