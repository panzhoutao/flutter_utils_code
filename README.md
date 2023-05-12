
[pubSvg]: https://img.shields.io/badge/pub-0.1.1-brightgreen
[pub]: https://github.com/panzhoutao/flutter_utils_code
[flutter_utils_code-pub.dev]: https://pub.dev/packages/flutter_utils_code


# flutter_utils_code
[![pub][pubSvg]][pub] 

A Flutter utils package.
pub.dev地址：[flutter_utils_code-pub.dev]

## Getting Started

## APIs
* ### 正则相关 -> RegexUtils
```
isMatch：匹配正则
isMobileExact:精确验证手机号
isMobileSimple:简单验证手机号
isEmail:验证邮箱
```


* ### 页面生命周期 -> LifeState
```
需要在 MaterialApp -> navigatorObservers 注册 lifeObserver
```


* ### 栏相关 -> BarUtils
```
getStatusBarHeight: 获取状态栏高度
```

* ### String扩展 -> StringExt
```
toDouble: 转换double
isChinaMobile: 判断中国手机号
isEmptyOrNull: 空和null
fromCommaToList: 用逗号隔开的string 转为 list
capitalizeFirst:首字母大写方法
trimAll：清除全部空格
```

* ### 函数防抖 -> EventFilter
```
debounce
throttle
```

* ### 文件相关 -> FileUtils
```
renderSize：转换double 文件大小 'B','K','M','G'
getNameFromFilePath ：根据路径获取文件名
```

* ### double扩展 -> DoubleExt
```
toMyStringAsFixed: 转换为String
toMyDouble: 1.2 -> 1.2  , 1.0 -> 1
```

* ### widget扩展 -> WidgetExt
```
padding
expand
center
align
```

* ### List扩展 -> ListExt
```
toCommaStr: 逗号隔开的字符串
```

* ### Duration扩展 -> DurationExt
```
toStringNoMicroseconds: 转换 00:00:00格式
```

* ### 时间工具 -> TimeUtils
```
getWeekStr：获取星期字符串
```
