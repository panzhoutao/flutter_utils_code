

extension ListExt<T> on List<T>? {
  /// 判断 List 是否为空或 null
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// 判断 List 是否不为空且不为 null
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  /// 将 List 中的元素用逗号连接成字符串
  String toCommaStr() {
    return this?.join(',') ?? '';
  }
}
