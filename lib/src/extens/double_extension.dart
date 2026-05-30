

extension DoubleExt on num {
  /// 格式化为固定小数位数，如果值为0，则直接返回 '0'
  String toMyStringAsFixed(int fractionDigits) {
    if (this == 0) {
      return '0';
    }
    return toStringAsFixed(fractionDigits);
  }

  /// 区分 int 和 double
  /// 例如 1.2 -> 1.2 , 1.0 -> 1
  String toMyDouble(int fractionDigits) {
    if (this % 1 == 0) {
      return '${toInt()}';
    } else {
      return toStringAsFixed(fractionDigits);
    }
  }
}
