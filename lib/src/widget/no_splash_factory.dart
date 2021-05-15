import 'package:flutter/material.dart';

/// 禁用水波纹效果
/// MaterialApp(
///   theme: ThemeData(
///    // 禁用水波纹效果
///     highlightColor: Colors.transparent,
///    splashFactory: const NoSplashFactory(),
///     primaryColor: Colors.white,
///  ),
/// )
class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  InteractiveInkFeature create({
    MaterialInkController? controller,
    RenderBox? referenceBox,
    Offset? position,
    Color? color,
    TextDirection? textDirection,
    bool containedInkWell: false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return new NoSplash(
      controller: controller!,
      referenceBox: referenceBox!,
      color: color!,
      onRemoved: onRemoved!,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Color color,
    required VoidCallback onRemoved,
  })   : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
          onRemoved: onRemoved,
          color: color,
        ) {
    controller.addInkFeature(this);
  }

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
