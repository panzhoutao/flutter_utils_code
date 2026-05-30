import 'package:flutter/material.dart';

/// 响应式布局
/// 根据宽度自动区分设备类型
/// 显示不同尺寸的布局
class Responsive extends StatelessWidget {
  /// 手机
  final Widget? mobile;

  /// 平板
  final Widget? tablet;

  /// 桌面
  final Widget? desktop;

  const Responsive({
    Key? key,
    this.desktop,
    this.tablet,
    this.mobile,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1100) {
      return desktop ?? tablet ?? mobile ?? const SizedBox();
    } else if (width >= 850) {
      return tablet ?? mobile ?? desktop ?? const SizedBox();
    } else {
      return mobile ?? tablet ?? desktop ?? const SizedBox();
    }
  }
}
