class StringUtils {
  /// 将 List 中的元素安全地以逗号连接成字符串
  static String? listToString(List? list) {
    if (list == null) {
      return null;
    }
    return list.join(',');
  }
}
