import 'dart:async';
import 'package:flutter/material.dart';

/// 防抖：n秒后执行；
/// 节流：n秒内最多执行一次。

/// 默认时长
const _defaultDuration = Duration(milliseconds: 380);

enum FilterType {
  debounce,
  throttle,
}

/// EventFilter 用于控制防抖和节流
class EventFilter {
  static final Map<String, Timer> _wrappers = {};

  /// 防抖：返回一个包装了防抖功能的闭包
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

  /// 节流：返回一个包装了节流功能的闭包
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

  /// 直接执行防抖或节流逻辑
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

  /// 在 state 的 dispose 方法里移除指定 Timer
  static void remove(String sign) {
    if (_wrappers.containsKey(sign)) {
      _wrappers[sign]?.cancel();
      _wrappers.remove(sign);
    }
  }

  /// 移除所有 Timer
  static void clear() {
    _wrappers.forEach((key, value) {
      value.cancel();
    });
    _wrappers.clear();
  }

  /// 移除指定 State Hash 前缀的所有 Timer
  static void removeState(String hashString) {
    final keysToRemove = _wrappers.keys.where((key) => key.startsWith(hashString)).toList();
    for (final key in keysToRemove) {
      remove(key);
    }
  }
}

/// State 扩展类，方便在 State 中快速使用防抖和节流并统一管理生命周期
extension EventFilterExtension on State {
  /// 返回一个绑定了当前 State 生命周期的防抖或节流的闭包
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

  /// 清理当前 State 关联的所有防抖和节流 Timer
  void clearStateFilter() {
    EventFilter.removeState(hashCode.toString());
  }
}
