

extension DateTimeExt on DateTime {
  /// 是否是今天
  bool get isToday {
    final now = DateTime.now();
    return isSameDay(now);
  }

  /// 是否是昨天
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return isSameDay(yesterday);
  }

  /// 是否是明天
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return isSameDay(tomorrow);
  }

  /// 是否和另一个日期在同一天
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// 是否和另一个日期在同一月份
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// 是否和另一个日期在同一年份
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// 获取当天的起始时间点 (00:00:00.000)
  DateTime get startOfDay => DateTime(year, month, day);

  /// 获取当天的结束时间点 (23:59:59.999)
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// 判断当前年份是否是闰年
  bool get isLeapYear {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// 获取当前月份的总天数
  int get daysInMonth {
    const days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (month == 2 && isLeapYear) {
      return 29;
    }
    return days[month - 1];
  }

  /// 增加指定天数，并返回新的 [DateTime]
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// 减少指定天数，并返回新的 [DateTime]
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }
}
