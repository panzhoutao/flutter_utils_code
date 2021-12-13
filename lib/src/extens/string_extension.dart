///@Description: String扩展
///@Author:         @Mr.pan
///@CreateDate:     2021/8/17
extension StringExt on String? {
  double toDouble() {
    return double.parse(this!);
  }

  int toInt() {
    return int.parse(this!);
  }

  bool isChinaMobile() {
    return RegExp(r'^((1[0-9][0-9]))\d{8}$').hasMatch(this!);
    // return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0-9])|(19)[0-9])\d{8}$').hasMatch(this);
  }

  bool isEmptyOrNull() {
    return this == null || this!.trim().isEmpty;
  }

  ///用逗号隔开的string 转为 list
  List<String> fromCommaToList() {
    if (this.isEmptyOrNull()) {
      return [];
    } else {
      return this!.split(',');
    }
  }
}
