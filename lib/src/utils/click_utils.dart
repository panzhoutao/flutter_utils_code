import 'dart:async';

import 'package:flutter/material.dart';


/// 防抖：n秒后执行；
/// 节流：n秒内最多执行一次。

///默认时长
const _defaultDuration = Duration(milliseconds: 380);

enum FilterType {
  debounce,
  throttle,
}

typedef VoidFunction = void Function();

///
///  @override
///   void dispose() {
///     EventFilter.remove("tag");
///     super.dispose();
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///
///       body: GestureDetector(
///         onTap: EventFilter.throttle(
///           "tag",
///           () {
///             print("------------");
///           },
///         ),
///         child: Text("按钮"),
///       ),
///     );
///   }
class EventFilter {
  static Map<String, Timer> _wrappers = {};

  ///防抖
  static VoidFunction debounce(
    String sign,
    function, {
    Duration duration = _defaultDuration,
  }) {
    return () {
      execute(
        sign,
        function,
        duration: duration,
        filterType: FilterType.debounce,
      );
    };
  }

  ///节流
  static VoidFunction throttle(
    String sign,
    function, {
    Duration duration = _defaultDuration,
  }) {
    return () {
      execute(
        sign,
        function,
        duration: duration,
        filterType: FilterType.throttle,
      );
    };
  }

  static void execute(
    String sign,
    function, {
    Duration duration = _defaultDuration,
    FilterType filterType = FilterType.debounce,
  }) {
    switch (filterType) {
      case FilterType.debounce:
        _wrappers[sign]?.cancel();
        break;
      case FilterType.throttle:
        if (_wrappers.containsKey(sign)) {
          return;
        } else {
          function.call();
        }
        break;
    }

    _wrappers[sign] = Timer(
      duration,
      () {
        if (filterType == FilterType.debounce) {
          function.call();
        }
        _wrappers[sign]?.cancel();
        _wrappers.remove(sign);
      },
    );
  }

  ///在state的dispose方法里移除Timer
  static void remove(String sign) {
    if (_wrappers.containsKey(sign)) {
      _wrappers[sign]?.cancel();
      _wrappers.remove(sign);
    }
  }

  ///移除所有Timer
  static void clear() {
    _wrappers.forEach((key, value) {
      remove(key);
    });
    _wrappers.clear();
  }

  static void removeState(String hashString) {
    _wrappers.removeWhere((key, value) => key.startsWith(hashString));
  }
}

///State扩展类
///每个State所有的防抖和节流都带有同样的前缀
///方便管理和统一释放资源
extension EventFilterExtension on State {
  stateFilter(
    String sign,
    Function function, {
    Duration duration = _defaultDuration,
    FilterType filterType = FilterType.debounce,
  }) {
    EventFilter.execute(
      "${this.hashCode.toString()}$sign",
      function,
      duration: duration,
      filterType: filterType,
    );
  }

  clearStateFilter() {
    EventFilter.removeState(this.hashCode.toString());
  }
}
