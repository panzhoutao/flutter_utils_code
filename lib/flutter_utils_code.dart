library flutter_utils_code;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_utils_code/view/toast.dart';
import 'constant/constant.dart';

///正则相关
class RegexUtils {

  /// regex: 正则规则
  static bool isMatch(final String regex, final String str) {
    return str != null && str.length > 0 && RegExp(regex).hasMatch(str);
  }

  ///简单验证手机号
  static bool isMobileSimple(String str) {
    return isMatch(RegexConstants.REGEX_MOBILE_SIMPLE, str);
  }

  ///精准校验手机号
  static bool isMobileExact(String str) {
    return isMatch(RegexConstants.REGEX_MOBILE_EXACT, str);
  }

  ///验证邮箱
  static bool isEmail(String str){
    return isMatch(RegexConstants.REGEX_EMAIL, str);
  }
}

///------------------------------------------------------------------------------------------------------------------------

///toast
///来源： toast: ^0.1.4
class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
      int gravity = 0,
      Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 20,
      Border border}) {
    ToastView.dismiss();
    ToastView.createView(
        msg, context, duration, gravity, backgroundColor, textColor, backgroundRadius, border);
  }
}

///------------------------------------------------------------------------------------------------------------------------


///栏相关
class BarUtils {

  ///获取状态栏高度
  static double getStatusBarHeight(){
    return MediaQueryData.fromWindow(window).padding.top;
  }
}




