## 0.2.1

* **Documentation**:
  - Fixed absolute document redirection links in English and Chinese READMEs.

## 0.2.0

* **Breaking Changes**: 
  - Changed license from GPLv3 to MIT.
  - Removed localized human-language hardcoded methods (e.g. `TimeUtils.getWeekStr` and Chinese weekday formatting).
  - Cleaned up duplicate list extension classes to prevent Stack Overflow crash.
  - Cleaned up and removed `my_extension.dart`, splitting contents into structured `double_extension.dart`, `widget_extension.dart` and `duration_extension.dart`.

* **New Features**:
  - Added `BuildContext` extensions for themes, dark mode, screen metrics, routing, and SnackBars.
  - Added `DateTime` extensions for today/yesterday checks, start/end of day, leap year checks, and month days calculation.
  - Added `num` Duration shorthand syntax (e.g. `500.milliseconds`, `2.seconds`, `1.hours`).
  - Added `Color` extensions for hex string parsing (`fromHex`), formatting (`toHex`), and shade adjusting (`darken`/`lighten`) with zero deprecation warnings on new Flutter SDKs.
  - Added `Map` extensions (`getOrDefault` and `removeNullValues`).
  - Added secure `PlatformUtils` preventing crashes on Web platform.
  - Added smart adaptive spacing layout widget `Gap`.

* **Documentation & Quality**:
  - Restructured into clean file hierarchy.
  - Added strict static analysis configuration.
  - Added comprehensive unit and widget integration tests (100% passed).
  - Documented all public APIs with standard Dartdoc comments.
  - Separated documentation into English `README.md` and Simplified Chinese `README-ZH.md`.

## 0.1.2
* 删除cupertino_localizations_delegate.dart

## 0.0.1
* initial release.
* 添加正则类，包含手机号精准验证
* 添加toast工具

## 0.0.2
* 正则类：增加简单手机号验证 , 验证邮箱
* 栏相关：增加获取状态栏高度

## 0.0.3
* 新增示例代码
* app相关：增加判断app是否为debug

## 0.0.4
* 更新了最新的工具

## 0.0.5
* 删除no_splash_factory类
* 增加DurationExt扩展

## 0.0.7
* 删除dio
* 增加函数防抖，函数节流

## 0.0.8
* 删除一些第三方库

## 0.0.10
* 扩展string

## 0.1.1
* 修改DurationExt
* 清楚全部空格
