/// @Description: String? 扩展
/// @Author:      @Mr.pan
extension StringExt on String? {
  /// 安全地转换为 double，解析失败时返回默认值
  double toDouble({double defaultValue = 0.0}) {
    if (this == null) return defaultValue;
    return double.tryParse(this!) ?? defaultValue;
  }

  /// 安全地转换为 int，解析失败时返回默认值
  int toInt({int defaultValue = 0}) {
    if (this == null) return defaultValue;
    return int.tryParse(this!) ?? defaultValue;
  }

  /// 安全地将首字母大写
  String capitalizeFirst() {
    if (this == null || this!.isEmpty) {
      return '';
    }
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  /// 安全地校验中国手机号格式
  bool isChinaMobile() {
    if (this == null) return false;
    return RegExp(r'^((1\d\d))\d{8}$').hasMatch(this!);
  }

  /// 判断是否为 null、空串或仅包含空白字符
  bool isEmptyOrNull() {
    return this == null || this!.trim().isEmpty;
  }

  /// 将以逗号隔开的字符串安全地转换为列表
  List<String> fromCommaToList() {
    if (isEmptyOrNull()) {
      return [];
    }
    return this!.split(',');
  }

  /// 清除字符串中的所有空白字符
  String trimAll() {
    if (this == null) return '';
    return this!.replaceAll(RegExp(r'\s+'), '');
  }
}
