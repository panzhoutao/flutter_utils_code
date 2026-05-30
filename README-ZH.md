# flutter_utils_code

[![pub package](https://img.shields.io/pub/v/flutter_utils_code.svg)](https://pub.dev/packages/flutter_utils_code)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-flutter%20%7C%20dart-blue.svg)](https://pub.dev/packages/flutter_utils_code)

一个轻量级、零外部依赖的 Dart & Flutter 常用工具和类型扩展库。旨在通过类型安全的扩展方法与智能布局辅助组件，显著提升日常开发效率。

🌐 **[English Documentation (英文文档)](https://github.com/panzhoutao/flutter_utils_code/blob/main/README.md)**


---

## 特性

*   **⚡ 快捷扩展方法**: 仿 Kotlin 风格的常用扩展，支持 `BuildContext`, `DateTime`, `num`, `Color`, `List?`, `String?` 以及 `Widget`。
*   **🛠️ 跨平台安全判定**: 安全检测 Web、移动端、桌面操作系统，保证在 Web 平台上运行也绝对不会崩溃。
*   **🎨 智能间距组件**: `Gap` 小部件，能自动根据祖先布局的方向渲染水平或垂直间距。
*   **⏳ 页面生命周期监听**: 通过 `LifeState` 轻松跟踪页面的前后台切换及路由进退。
*   **🔒 高性能且零依赖**: 干净简洁的代码库，没有任何外部 Package 依赖。

---

## 安装

在你的 `pubspec.yaml` 中添加：

```yaml
dependencies:
  flutter_utils_code: ^0.2.0
```

或者在终端运行：

```bash
flutter pub add flutter_utils_code
```

---

## 使用示例

### 1. BuildContext 快捷扩展
```dart
import 'package:flutter_utils_code/extens.dart';

Widget build(BuildContext context) {
  // Theme & Colors | 主题与颜色快捷获取
  final primaryColor = context.colorScheme.primary;
  final isDark = context.isDarkMode;

  // Media Query | 屏幕宽高
  final width = context.screenWidth;
  final height = context.screenHeight;

  // Simple Navigation | 快捷路由导航
  context.push(NextPage());
  context.pop();

  // Quick SnackBar | 快捷提示
  context.showSnackBar("操作成功！");
}
```

### 2. num 与 Duration 极简时长语法
```dart
import 'package:flutter_utils_code/extens.dart';

final delay = 500.milliseconds; // Duration(milliseconds: 500)
final timeout = 5.seconds;       // Duration(seconds: 5)
final duration = 2.hours;        // Duration(hours: 2)

// Double formatting | 双精度数值格式化
print(1.2345.toMyStringAsFixed(2)); // "1.23"
print(1.0.toMyDouble(2));            // "1" (清除无用的尾随 .0)
print(1.2.toMyDouble(2));            // "1.20"
```

### 3. DateTime 日期判定与计算
```dart
import 'package:flutter_utils_code/extens.dart';

final date = DateTime.now();

if (date.isToday) { ... }
if (date.isYesterday) { ... }

final start = date.startOfDay; // 当天起始时间：00:00:00.000
final end = date.endOfDay;     // 当天结束时间：23:59:59.999

final leap = date.isLeapYear;   // 是否为闰年
final days = date.daysInMonth;  // 当月天数（自动处理闰年2月）

final future = date.addDays(5);     // 增加 5 天
final past = date.subtractDays(2);  // 减少 2 天
```

### 4. 智能间距组件 Gap
```dart
import 'package:flutter_utils_code/widget.dart';

// 在 Column 中：自动渲染为垂直间距 (height: 16)
Column(
  children: [
    Text("标题"),
    Gap(16),
    Text("子标题"),
  ],
)

// 在 Row 中：自动渲染为水平间距 (width: 8)
Row(
  children: [
    Icon(Icons.star),
    Gap(8),
    Text("评分"),
  ],
)
```

### 5. Color 颜色 Hex 解析与亮度调节
```dart
import 'package:flutter_utils_code/extens.dart';

// Hex 解析 (支持带或不带 '#' 的 3位、6位、8位 hex 字符串)
final color = ColorExt.fromHex('#FF5733');
final color2 = ColorExt.fromHex('FFF'); // #FFFFFF

// 输出 Hex 字符串
print(color.toHex()); // "#FF5733"

// 调节明暗度
final darkColor = color.darken(0.2); // 调暗 20%
final lightColor = color.lighten(0.1); // 调亮 10%
```

### 6. EventFilter 事件过滤器 (防抖与节流)
```dart
import 'package:flutter_utils_code/utils.dart';

// 限制按钮点击在 500ms 内只响应一次
ElevatedButton(
  onPressed: () {
    EventFilter.execute("submit_btn", () {
      submitData();
    }, duration: Duration(milliseconds: 500), filterType: FilterType.throttle);
  },
  child: Text("提交"),
)
```

### 7. PlatformUtils 跨平台安全判定
```dart
import 'package:flutter_utils_code/utils.dart';

// 安全判定，在 Web 平台上运行也不会因读取 Platform 属性而崩溃
if (PlatformUtils.isWeb) {
  print("运行在 Web 浏览器中");
} else if (PlatformUtils.isAndroid || PlatformUtils.isIOS) {
  print("运行在移动端 App 中");
}
```

---

## API 参考指南

### 类型扩展 (Extensions)
*   `BuildContextExt`: 快捷获取主题、MediaQuery，控制页面跳转和 SnackBar 弹框。
*   `DateTimeExt`: 今天/昨天/明天判定，当天起止时间，加减天数，闰年和月份天数计算。
*   `NumDurationExt`: 仿 Kotlin 风格的 `.seconds`、`.milliseconds`、`.hours` 等时长扩展。
*   `ColorExt`: 十六进制 Hex 解析和输出，暗色与亮色调整。
*   `ListExt`: 列表安全空校验 `isNullOrEmpty` / `isNotNullOrEmpty`，列表安全转逗号字符串。
*   `StringExt`: 安全转换 `int` 和 `double` 并提供失败默认值，首字母大写，清除所有空格，手机号格式校验。
*   `WidgetExt`: 点击防抖交互包装，快捷包裹 `padding`、`expand`、`center`、`align`。

### 工具与小部件 (Utilities & Widgets)
*   `PlatformUtils`: 跨平台安全的运行环境及操作系统判定。
*   `FileUtils`: 转换人类可读文件大小（`.renderSize()`），提取路径文件名。
*   `RegexUtils`: 常用格式校验（手机号简单/精准校验，邮箱校验）。
*   `LifeState`: 监听页面可见状态（resumed / paused）。
*   `Gap`: 根据 Row/Column 方向自适应渲染大小的智能间距小部件。

---

## 开源协议

[MIT License](LICENSE)
