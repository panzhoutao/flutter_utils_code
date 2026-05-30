

extension MapExt<K, V> on Map<K, V> {
  /// 获取指定键的值，如果该键对应的值不存在或为 `null`，则返回指定的默认值 [defaultValue]
  V getOrDefault(K key, V defaultValue) {
    return this[key] ?? defaultValue;
  }

  /// 移除 Map 中所有值为 `null` 的键值对，并返回一个排除了 null 值的新 Map 副本
  Map<K, V> removeNullValues() {
    final result = Map<K, V>.from(this);
    result.removeWhere((key, value) => value == null);
    return result;
  }

  /// 直接在原 Map 上移除所有值为 `null` 的键值对
  void removeNullValuesInPlace() {
    removeWhere((key, value) => value == null);
  }
}
