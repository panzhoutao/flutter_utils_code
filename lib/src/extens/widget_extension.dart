

import 'package:flutter/material.dart';
import '../utils/click_utils.dart';

extension WidgetExt on Widget {
  /// 快捷添加外边距
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  /// 快捷嵌套 Expanded
  Widget expand() {
    return Expanded(child: this);
  }

  /// 快捷居中
  Widget center() {
    return Center(child: this);
  }

  /// 快捷对齐
  Widget align(AlignmentGeometry alignmentGeometry) {
    return Align(
      alignment: alignmentGeometry,
      child: this,
    );
  }

  /// 快速防抖/节流点击事件
  Widget onTap(
    VoidCallback? onTap, {
    Duration duration = const Duration(milliseconds: 380),
    String? memo,
  }) {
    if (onTap == null) return this;
    return GestureDetector(
      onTap: () {
        final key = memo ?? '${hashCode}_onTap';
        EventFilter.execute(
          key,
          onTap,
          duration: duration,
          filterType: FilterType.throttle,
        );
      },
      child: this,
    );
  }
}
