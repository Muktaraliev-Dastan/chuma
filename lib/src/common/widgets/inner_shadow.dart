import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.shadows = const <Shadow>[],
    Widget? child,
  }) : super(key: key, child: child);

  final List<Shadow> shadows;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject.shadows = shadows;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late List<Shadow> shadows;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    final bounds = offset & size;

    context.canvas.saveLayer(bounds, Paint());
    context.paintChild(child!, offset);

    for (final shadow in shadows) {
      final shadowRect = bounds.inflate(shadow.blurSigma);
      final shadowPaint = Paint()
        ..blendMode = BlendMode.srcATop
        ..colorFilter = ColorFilter.mode(shadow.color, BlendMode.srcOut)
        ..imageFilter = ImageFilter.blur(
            sigmaX: shadow.blurSigma, sigmaY: shadow.blurSigma);
      context.canvas
        ..saveLayer(shadowRect, shadowPaint)
        ..translate(shadow.offset.dx, shadow.offset.dy);
      context.paintChild(child!, offset);
      context.canvas.restore();
    }

    context.canvas.restore();
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class InnerShadow extends SingleChildRenderObjectWidget {
//
//   final double blur;
//   final Color color;
//   final Offset offset;
//   final Widget child;
//
// const InnerShadow ({
//   Key? key,
//   this.blur = 15,
//   this.color = const Color(0x25656565),
//   this.offset = const Offset(0, 4),
//   required this.child,
// }) : super(key: key, child: child);
//
//
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     final _RenderInnerShadow renderObject = _RenderInnerShadow();
//     updateRenderObject(context, renderObject);
//     return renderObject;
//   }
//
//   @override
//   void updateRenderObject(
//       BuildContext context, _RenderInnerShadow renderObject) {
//     renderObject
//       ..color = color
//       ..blur = blur
//       ..dx = offset.dx
//       ..dy = offset.dy;
//   }
// }
//
// class _RenderInnerShadow extends RenderProxyBox {
//   double blur = 15;
//   Color color = const Color(0x25656565);
//   double dx = 0;
//   double dy = 4;
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     if (child == null) return;
//
//     final Rect rectOuter = offset & size;
//     final Rect rectInner = Rect.fromLTWH(
//       offset.dx,
//       offset.dy,
//       size.width - dx,
//       size.height - dy,
//     );
//
//     final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
//     context.paintChild(child!, offset);
//     final Paint shadowPaint = Paint()
//       ..blendMode = BlendMode.srcATop
//       ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
//       ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);
//
//     canvas
//       ..saveLayer(rectOuter, shadowPaint)
//       ..saveLayer(rectInner, Paint())
//       ..translate(dx, dy);
//     context.paintChild(child!, offset);
//     context.canvas..restore()..restore()..restore();
//   }
// }