// @Description: 正则表达式匹配及常见格式校验工具
// @Author:      @Mr.pan

/// 正则表达式实用工具类
class RegexUtils {
  /// 校验字符串是否匹配指定的正则表达式
  ///
  /// - [regex]: 正则表达式规则字符串
  /// - [str]: 待匹配的字符串
  static bool isMatch(final String regex, final String str) {
    return str.isNotEmpty && RegExp(regex).hasMatch(str);
  }

  /// 简单验证手机号格式（1开头后面接10位数字）
  static bool isMobileSimple(String str) {
    return isMatch(RegexConstants.regexMobileSimple, str);
  }

  /// 精准校验中国大陆手机号
  static bool isMobileExact(String str) {
    return isMatch(RegexConstants.regexMobileExact, str);
  }

  /// 验证邮箱格式是否正确
  static bool isEmail(String str) {
    return isMatch(RegexConstants.regexEmail, str);
  }
}

/// 正则表达式常量库
class RegexConstants {
  /// 简单手机号正则表达式
  static const String regexMobileSimple = "^[1]\\d{10}\$";

  /// 中国大陆精准手机号正则表达式
  ///
  /// 支持中国移动、中国联通、中国电信、虚拟运营商等频段
  static const String regexMobileExact =
      "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(16[6])|(17[0,1,3,5-8])|(18[0-9])|(19[1,8,9]))\\d{8}\$";

  /// 常见邮箱格式正则表达式
  static const String regexEmail =
      "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
}
