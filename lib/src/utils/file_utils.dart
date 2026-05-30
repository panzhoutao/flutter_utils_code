class FileUtils {
  /// 转换 double 文件大小为可读字符串（如 "1.23 KB"）
  static String renderSize(double? value) {
    if (value == null || value <= 0) {
      return '0 B';
    }
    const List<String> unitArr = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB'];
    int index = 0;
    while (value! >= 1024 && index < unitArr.length - 1) {
      index++;
      value = value / 1024;
    }
    return '${value.toStringAsFixed(2)} ${unitArr[index]}';
  }

  /// 根据路径获取文件名，兼容 Windows (\) 和 macOS/Linux (/) 的路径分隔符
  static String getNameFromFilePath(String? path) {
    if (path == null || path.isEmpty) {
      return '';
    }
    final posixSeparator = path.lastIndexOf('/');
    final windowsSeparator = path.lastIndexOf('\\');
    final lastSeparator = posixSeparator > windowsSeparator ? posixSeparator : windowsSeparator;
    if (lastSeparator == -1) {
      return path;
    }
    return path.substring(lastSeparator + 1);
  }
}