

extension NumDurationExt on num {
  /// 获取以当前数值为**毫秒**的 [Duration]
  Duration get milliseconds => Duration(microseconds: (this * 1000).toInt());

  /// 获取以当前数值为**秒**的 [Duration]
  Duration get seconds => Duration(microseconds: (this * 1000 * 1000).toInt());

  /// 获取以当前数值为**分钟**的 [Duration]
  Duration get minutes => Duration(microseconds: (this * 1000 * 1000 * 60).toInt());

  /// 获取以当前数值为**小时**的 [Duration]
  Duration get hours => Duration(microseconds: (this * 1000 * 1000 * 60 * 60).toInt());

  /// 获取以当前数值为**天**的 [Duration]
  Duration get days => Duration(microseconds: (this * 1000 * 1000 * 60 * 60 * 24).toInt());
}
