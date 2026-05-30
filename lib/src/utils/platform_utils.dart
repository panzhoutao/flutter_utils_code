

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtils {
  PlatformUtils._();

  /// 当前是否运行在 Web 浏览器中
  static bool get isWeb => kIsWeb;

  /// 当前是否是 Android 平台（已对 Web 平台进行安全隔离）
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  /// 当前是否是 iOS 平台（已对 Web 平台进行安全隔离）
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  /// 当前是否是 macOS 平台（已对 Web 平台进行安全隔离）
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;

  /// 当前是否是 Windows 平台（已对 Web 平台进行安全隔离）
  static bool get isWindows => !kIsWeb && Platform.isWindows;

  /// 当前是否是 Linux 平台（已对 Web 平台进行安全隔离）
  static bool get isLinux => !kIsWeb && Platform.isLinux;

  /// 当前是否是移动端平台（Android 或 iOS）
  static bool get isMobile => isAndroid || isIOS;

  /// 当前是否是桌面端系统（Windows、macOS 或 Linux）
  static bool get isDesktop => isWindows || isMacOS || isLinux;
}
