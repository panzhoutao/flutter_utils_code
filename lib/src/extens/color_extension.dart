import 'package:flutter/material.dart';

/// Color 颜色操作与 Hex 转换扩展
extension ColorExt on Color {
  /// 从十六进制字符串解析并创建 [Color]
  ///
  /// 支持以下格式的输入（可带或不带 `#`）：
  /// - 3位简写：`FFF` -> `#FFFFFF`
  /// - 6位标准：`FF5733` -> `#FF5733`
  /// - 8位带透明通道：`FFFF5733` -> 透明度为 100% 的 `#FF5733`
  static Color fromHex(String hexString) {
    var hex = hexString.replaceFirst('#', '').trim();
    if (hex.length == 3) {
      final r = hex[0];
      final g = hex[1];
      final b = hex[2];
      hex = '$r$r$g$g$b$b';
    }

    final buffer = StringBuffer();
    if (hex.length == 6) {
      buffer.write('ff');
      buffer.write(hex);
    } else if (hex.length == 8) {
      buffer.write(hex);
    } else {
      throw ArgumentError('Invalid hex color format: $hexString');
    }

    final intColorValue = int.tryParse(buffer.toString(), radix: 16);
    if (intColorValue == null) {
      throw ArgumentError('Invalid hex color string: $hexString');
    }
    return Color(intColorValue);
  }

  /// 将 [Color] 转换为十六进制字符串格式（例如 `#FF5733`）
  ///
  /// - [includeHash] 是否在结果中包含 `#` 前缀，默认为 `true`。
  /// - [includeAlpha] 是否包含 Alpha 透明通道，默认为 `false`（返回6位RGB）。如果为 `true` 则返回8位ARGB。
  String toHex({bool includeHash = true, bool includeAlpha = false}) {
    final hash = includeHash ? '#' : '';
    final int argb = toARGB32();
    if (includeAlpha) {
      return '$hash${argb.toRadixString(16).padLeft(8, '0').toUpperCase()}';
    } else {
      final rgbValue = argb & 0x00FFFFFF;
      return '$hash${rgbValue.toRadixString(16).padLeft(6, '0').toUpperCase()}';
    }
  }

  /// 调暗颜色
  ///
  /// [factor] 表示颜色亮度调暗的系数，取值范围为 `0.0` 至 `1.0`，默认值为 `0.1`。
  Color darken([double factor = 0.1]) {
    assert(factor >= 0.0 && factor <= 1.0);
    final f = 1.0 - factor;
    final int argb = toARGB32();
    final int a = (argb >> 24) & 0xFF;
    final int r = (argb >> 16) & 0xFF;
    final int g = (argb >> 8) & 0xFF;
    final int b = argb & 0xFF;
    return Color.fromARGB(
      a,
      (r * f).round().clamp(0, 255),
      (g * f).round().clamp(0, 255),
      (b * f).round().clamp(0, 255),
    );
  }

  /// 调亮颜色
  ///
  /// [factor] 表示颜色亮度增加的系数，取值范围为 `0.0` 至 `1.0`，默认值为 `0.1`。
  Color lighten([double factor = 0.1]) {
    assert(factor >= 0.0 && factor <= 1.0);
    final int argb = toARGB32();
    final int a = (argb >> 24) & 0xFF;
    final int r = (argb >> 16) & 0xFF;
    final int g = (argb >> 8) & 0xFF;
    final int b = argb & 0xFF;
    return Color.fromARGB(
      a,
      (r + (255 - r) * factor).round().clamp(0, 255),
      (g + (255 - g) * factor).round().clamp(0, 255),
      (b + (255 - b) * factor).round().clamp(0, 255),
    );
  }
}
