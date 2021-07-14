import 'package:flutter/material.dart';

///
/// 响应式布局
/// 根据宽度自动区分设备类型
/// 显示不同尺寸的布局
///
/// 下面布局同样可以做这件事情
/// Container(
///   child: LayoutBuilder(context, contraints){
///     if(contraints.maxWidth > 600){
/// 		...
/// 	}
///   }
/// )
///
class Responsive extends StatelessWidget {
  ///手机
  final Widget? mobile;

  ///平板
  final Widget? tablet;

  ///桌面
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
    final Size _size = MediaQuery.of(context).size;

    Widget? _widget;

    if (_size.width >= 1100) {
      _widget = desktop;
    } else if (_size.width >= 850) {
      _widget = tablet;
    } else {
      _widget = mobile;
    }

    return _widget ?? Container();
  }
}
