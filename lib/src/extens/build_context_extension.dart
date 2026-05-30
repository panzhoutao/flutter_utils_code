

import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  /// 获取当前的 [ThemeData]
  ThemeData get theme => Theme.of(this);

  /// 获取当前的 [TextTheme]
  TextTheme get textTheme => theme.textTheme;

  /// 获取当前的 [ColorScheme]
  ColorScheme get colorScheme => theme.colorScheme;

  /// 获取当前的 [MediaQueryData]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// 获取屏幕宽度
  double get screenWidth => mediaQuery.size.width;

  /// 获取屏幕高度
  double get screenHeight => mediaQuery.size.height;

  /// 判断当前是否处于暗黑模式
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// 快捷导航：Push 到一个新页面（使用默认的 [MaterialPageRoute]）
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// 快捷导航：Pop 关闭当前页面
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  /// 快捷提示：弹出底部的 [SnackBar]
  void showSnackBar(String message, {Duration duration = const Duration(seconds: 2)}) {
    final messenger = ScaffoldMessenger.maybeOf(this);
    if (messenger != null) {
      messenger.removeCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: duration,
        ),
      );
    }
  }
}
