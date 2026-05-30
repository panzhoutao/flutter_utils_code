

import 'dart:async';
import 'package:flutter/material.dart';

/// 默认的事件间隔时间
const _defaultDuration = Duration(milliseconds: 380);

/// 过滤的事件类型：防抖 (debounce) 和节流 (throttle)
enum FilterType {
  /// 防抖：在事件触发 n 秒后才执行，如果在 n 秒内再次触发，则重新计算时间
  debounce,

  /// 节流：在 n 秒内最多只会执行一次事件
  throttle,
}

/// [EventFilter] 用于控制防抖和节流事件的触发逻辑
class EventFilter {
  static final Map<String, Timer> _wrappers = {};

  /// 防抖：返回一个包装了防抖功能的闭包。
  ///
  /// - [sign]: 唯一标识该事件的键名
  /// - [function]: 触发的事件回调
  /// - [duration]: 防抖间隔，默认是 380 毫秒
  static VoidCallback debounce(
    String sign,
    VoidCallback function, {
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

  /// 节流：返回一个包装了节流功能的闭包。
  ///
  /// - [sign]: 唯一标识该事件的键名
  /// - [function]: 触发的事件回调
  /// - [duration]: 节流间隔，默认是 380 毫秒
  static VoidCallback throttle(
    String sign,
    VoidCallback function, {
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

  /// 直接执行防抖或节流的校验逻辑并触发回调。
  ///
  /// - [sign]: 唯一标识该事件的键名
  /// - [function]: 待执行的事件回调
  /// - [duration]: 事件限制时长，默认是 380 毫秒
  /// - [filterType]: 过滤类型，默认为防抖 [FilterType.debounce]
  static void execute(
    String sign,
    VoidCallback function, {
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
          function();
        }
        break;
    }

    _wrappers[sign] = Timer(
      duration,
      () {
        if (filterType == FilterType.debounce) {
          function();
        }
        _wrappers[sign]?.cancel();
        _wrappers.remove(sign);
      },
    );
  }

  /// 移除指定键名的 Timer，通常在组件的 `dispose` 生命周期中手动清理
  static void remove(String sign) {
    if (_wrappers.containsKey(sign)) {
      _wrappers[sign]?.cancel();
      _wrappers.remove(sign);
    }
  }

  /// 移除当前所有的 Timer 并释放资源
  static void clear() {
    _wrappers.forEach((key, value) {
      value.cancel();
    });
    _wrappers.clear();
  }

  /// 移除包含特定前缀（如组件 [State] 的 hashCode）的所有事件 Timer
  static void removeState(String hashString) {
    final keysToRemove = _wrappers.keys.where((key) => key.startsWith(hashString)).toList();
    for (final key in keysToRemove) {
      remove(key);
    }
  }
}

/// 快捷应用于 [State] 的扩展，以便自动绑定生命周期
extension EventFilterExtension on State {
  /// 返回一个绑定了当前 State 生命周期的防抖或节流的闭包
  ///
  /// 该闭包的唯一标识会自动带上当前 [State] 的 hashCode，确保组件实例隔离。
  VoidCallback stateFilter(
    String sign,
    VoidCallback function, {
    Duration duration = _defaultDuration,
    FilterType filterType = FilterType.debounce,
  }) {
    return () {
      EventFilter.execute(
        "${hashCode.toString()}$sign",
        function,
        duration: duration,
        filterType: filterType,
      );
    };
  }

  /// 清理当前 State 关联的所有防抖和节流事件 Timer。
  ///
  /// 推荐在 State 的 `dispose` 生命周期中调用。
  void clearStateFilter() {
    EventFilter.removeState(hashCode.toString());
  }
}
