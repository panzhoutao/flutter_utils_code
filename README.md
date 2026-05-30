# flutter_utils_code

[![pub package](https://img.shields.io/pub/v/flutter_utils_code.svg)](https://pub.dev/packages/flutter_utils_code)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-flutter%20%7C%20dart-blue.svg)](https://pub.dev/packages/flutter_utils_code)

A lightweight, zero-dependency Dart & Flutter utility and extension library. Designed to improve development efficiency with type-safe extensions and smart layout helpers.

一个轻量级、零外部依赖的 Dart & Flutter 常用工具和类型扩展库。旨在通过类型安全的扩展方法与智能布局辅助组件，显著提升日常开发效率。

---

## Features | 特性

*   **⚡ Extension Methods**: kotlin-like extensions on `BuildContext`, `DateTime`, `num`, `Color`, `List?`, `String?` and `Widget`.
*   **🛠️ Safe Platform Check**: Detect web, mobile, and desktop operating systems safely without crashing on Web platforms.
*   **🎨 Smart Layout Helpers**: `Gap` widget which automatically adapts to Row/Column orientation.
*   **⏳ Lifecycle States**: Track widget visible state easily with `LifeState`.
*   **🔒 High Performance & Zero Dependency**: No external package dependencies, clean codebase.

---

## Installation | 安装

Add `flutter_utils_code` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_utils_code: ^0.2.0
```

Or run:

```bash
flutter pub add flutter_utils_code
```

---

## Usage Examples | 使用示例

### 1. BuildContext Extensions | BuildContext 扩展
```dart
import 'package:flutter_utils_code/extens.dart';

Widget build(BuildContext context) {
  // Theme & Colors | 主题与颜色
  final primaryColor = context.colorScheme.primary;
  final isDark = context.isDarkMode;

  // Media Query | 屏幕宽高
  final width = context.screenWidth;
  final height = context.screenHeight;

  // Simple Navigation | 快捷导航
  context.push(NextPage());
  context.pop();

  // Quick SnackBar | 快捷提示
  context.showSnackBar("Success!");
}
```

### 2. num & Duration Extension | 数值与时长语法
```dart
import 'package:flutter_utils_code/extens.dart';

final delay = 500.milliseconds; // Duration(milliseconds: 500)
final timeout = 5.seconds;       // Duration(seconds: 5)
final duration = 2.hours;        // Duration(hours: 2)

// Double formatting | 双精度格式化
print(1.2345.toMyStringAsFixed(2)); // "1.23"
print(1.0.toMyDouble(2));            // "1" (removes trailing .0)
print(1.2.toMyDouble(2));            // "1.20"
```

### 3. DateTime Extensions | 日期时间扩展
```dart
import 'package:flutter_utils_code/extens.dart';

final date = DateTime.now();

if (date.isToday) { ... }
if (date.isYesterday) { ... }

final start = date.startOfDay; // 00:00:00.000
final end = date.endOfDay;     // 23:59:59.999

final leap = date.isLeapYear;   // Is leap year | 是否为闰年
final days = date.daysInMonth;  // Days in current month | 当月天数

final future = date.addDays(5);     // Date + 5 days
final past = date.subtractDays(2);  // Date - 2 days
```

### 4. Smart Gap Widget | 智能间距组件
```dart
import 'package:flutter_utils_code/widget.dart';

// In Column: acts as Vertical space (height: 16)
// 在 Column 中: 自动渲染为垂直间距
Column(
  children: [
    Text("Title"),
    Gap(16),
    Text("Subtitle"),
  ],
)

// In Row: acts as Horizontal space (width: 8)
// 在 Row 中: 自动渲染为水平间距
Row(
  children: [
    Icon(Icons.star),
    Gap(8),
    Text("Rating"),
  ],
)
```

### 5. Color Extensions | 颜色扩展与 Hex 解析
```dart
import 'package:flutter_utils_code/extens.dart';

// Hex Parsing | 从 Hex 字符串快速创建 Color
final color = ColorExt.fromHex('#FF5733');
final color2 = ColorExt.fromHex('FFF'); // #FFFFFF

// To Hex String | 转换为 Hex 字符串
print(color.toHex()); // "#FF5733"

// Darken & Lighten | 调节颜色亮度
final darkColor = color.darken(0.2);
final lightColor = color.lighten(0.1);
```

### 6. Event Filter (Debounce & Throttle) | 防抖与节流
```dart
import 'package:flutter_utils_code/utils.dart';

// Throttle a button tap for 500ms
// 按钮点击在 500ms 内只响应一次
ElevatedButton(
  onPressed: () {
    EventFilter.execute("submit_btn", () {
      submitData();
    }, duration: Duration(milliseconds: 500), filterType: FilterType.throttle);
  },
  child: Text("Submit"),
)
```

### 7. Safe Platform Check | 安全平台检测
```dart
import 'package:flutter_utils_code/utils.dart';

// Safe check, will NOT crash on Web platform
// 安全判定，在 Web 平台上运行也不会崩溃
if (PlatformUtils.isWeb) {
  print("Running in browser");
} else if (PlatformUtils.isAndroid || PlatformUtils.isIOS) {
  print("Running on mobile app");
}
```

---

## APIs Reference | API 概览

### Extensions | 属性扩展
*   `BuildContextExt`: Quick access to Theme, MediaQuery, routing, and SnackBars.
*   `DateTimeExt`: Today/Yesterday helper, start/end of day, days in month, and day arithmetic.
*   `NumDurationExt`: Kotlin-like `.seconds`, `.milliseconds`, `.hours` duration syntax.
*   `ColorExt`: Hex parsing/formatting, color shade adjustment.
*   `ListExt`: Safe `isNullOrEmpty`, `isNotNullOrEmpty`, and list-to-comma string conversion.
*   `StringExt`: Safe parsing to `int` and `double` with fallback default values, `.trimAll()`, `.capitalizeFirst()`.
*   `WidgetExt`: Tap throttle wrapping, layout wrapping (`.padding()`, `.expand()`, `.center()`, `.align()`).

### Utilities & Widgets | 独立工具与布局组件
*   `PlatformUtils`: Secure and safe platform checking.
*   `FileUtils`: Read human-readable file sizes (`.renderSize()`), filename extraction.
*   `RegexUtils`: Formats validation (simple/exact mobile, emails).
*   `LifeState`: Detect page visibility and lifecycle transitions (resumed/paused).
*   `Gap`: Automatic layout spacer widget for Column/Row.

---

## LICENSE | 开源许可

[MIT License](LICENSE)
