

class TimeUtils {
  /// 将 Duration 格式化为不含语言特征的字符串，如 "11:22:33" 或 "22:33"
  static String formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    final minutesStr = twoDigits(minutes.abs());
    final secondsStr = twoDigits(seconds.abs());

    final sign = duration.isNegative ? '-' : '';

    if (hours.abs() > 0) {
      return '$sign${hours.abs()}:$minutesStr:$secondsStr';
    } else {
      return '$sign$minutesStr:$secondsStr';
    }
  }

  /// 是否是同一天
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}