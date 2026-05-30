import 'package:flutter/material.dart';
import 'click_utils.dart';

/// num 扩展
extension DoubleExt on num {
  String toMyStringAsFixed(int fractionDigits) {
    if (this == 0) {
      return '0';
    }
    return toStringAsFixed(fractionDigits);
  }

  /// 区分 int 和 double
  /// 例如 1.2 -> 1.2  , 1.0 -> 1
  String toMyDouble(int fractionDigits) {
    if (this % 1 == 0) {
      return '${toInt()}';
    } else {
      return toStringAsFixed(fractionDigits);
    }
  }
}

/// widget 扩展
extension WidgetExt on Widget {
  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget expand() {
    return Expanded(child: this);
  }

  Widget center() {
    return Center(child: this);
  }

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

/// Duration 扩展
extension DurationExt on Duration {
  /// 格式化为不含微秒的字符串，如 1:10:00 或 10:00
  String toStringNoMicroseconds() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    if (inMicroseconds < 0) {
      return "-${-this}";
    }
    String twoDigitMinutes =
        twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(inSeconds.remainder(Duration.secondsPerMinute));

    String hourStr = '';
    if (inHours > 0) {
      hourStr = '$inHours:';
    }

    return "$hourStr$twoDigitMinutes:$twoDigitSeconds";
  }
}
