// @Description: 字符串操作相关工具类
// @Author:      @Mr.pan

/// 字符串相关独立工具类
class StringUtils {
  /// 将 List 中的元素安全地以逗号连接成字符串
  static String? listToString(List<dynamic>? list) {
    if (list == null) {
      return null;
    }
    return list.join(',');
  }
}
