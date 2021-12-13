import 'package:flutter/material.dart';

///double扩展
extension DoubleExt on num {
  String toMyStringAsFixed(int fractionDigits) {
    if (this == 0) {
      return '0';
    }
    return this.toStringAsFixed(fractionDigits);
  }

  ///区分int 和 double
  /// 例如 1.2 -> 1.2  , 1.0 -> 1
  String toMyDouble(int fractionDigits) {
    if (this % 1 == 0) {
      return '${this.toInt()}';
    } else {
      return this.toStringAsFixed(fractionDigits);
    }
  }
}

///widget扩展
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
}

///list扩展
extension ListExt on List {
  ///逗号隔开的字符串
  String toCommaStr() {
    List tempList = [];
    String str = '';
    this.forEach((f) {
      tempList.add(f);
    });

    tempList.forEach((f) {
      if (str == '') {
        str = "$f";
      } else {
        str = "$str" "," "$f";
      }
    });

    return str;
  }
}

///Duration 扩展
extension DurationExt on Duration {

  /// 1:10:00
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
    return "$inHours:$twoDigitMinutes:$twoDigitSeconds";
  }
}
