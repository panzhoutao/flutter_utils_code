

extension DurationExt on Duration {
  /// 格式化为不含微秒的字符串，如 1:10:00 或 10:00
  String toStringNoMicroseconds() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    if (inMicroseconds < 0) {
      return "-${-this}";
    }
    final String twoDigitMinutes =
        twoDigits(inMinutes.remainder(Duration.minutesPerHour));
    final String twoDigitSeconds =
        twoDigits(inSeconds.remainder(Duration.secondsPerMinute));

    String hourStr = '';
    if (inHours > 0) {
      hourStr = '$inHours:';
    }

    return "$hourStr$twoDigitMinutes:$twoDigitSeconds";
  }
}
