

import 'package:flutter/material.dart';

/// 响应式布局容器，根据当前屏幕宽度自动渲染不同适配尺寸的组件，并提供便捷的尺寸断点检测
class Responsive extends StatelessWidget {
  /// 移动端展示组件（宽度 < 850）
  final Widget? mobile;

  /// 平板端展示组件（850 <= 宽度 < 1100）
  final Widget? tablet;

  /// 桌面端展示组件（宽度 >= 1100）
  final Widget? desktop;

  const Responsive({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
  });

  /// 静态辅助方法：判断当前屏幕宽度是否属于移动端区间（宽度 < 850）
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  /// 静态辅助方法：判断当前屏幕宽度是否属于平板端区间（850 <= 宽度 < 1100）
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1100;

  /// 静态辅助方法：判断当前屏幕宽度是否属于桌面端区间（宽度 >= 1100）
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
