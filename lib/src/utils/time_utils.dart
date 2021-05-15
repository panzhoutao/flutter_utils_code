

class TimeUtils {

  ///星期string
  static getWeekStr(DateTime value) {
    var weekStr = '';
    switch (value.weekday) {
      case 1:
        weekStr = '周一';
        break;
      case 2:
        weekStr = '周二';
        break;
      case 3:
        weekStr = '周三';
        break;
      case 4:
        weekStr = '周四';
        break;
      case 5:
        weekStr = '周五';
        break;
      case 6:
        weekStr = '周六';
        break;
      case 7:
        weekStr = '周日';
        break;
    }
    return weekStr;
  }

  ///将 unix 时间戳转换为特定时间文本，如年月日
  static String convertTime(int timestamp) {
    DateTime msgTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    DateTime nowTime = DateTime.now();

    if(nowTime.year == msgTime.year) {//同一年
      if(nowTime.month == msgTime.month) {//同一月
        if(nowTime.day == msgTime.day) {//同一天 时:分
          return msgTime.hour.toString()+":"+msgTime.minute.toString();
        }else {
          if(nowTime.day - msgTime.day == 1) {//昨天
            return "昨天";
          }else if(nowTime.day - msgTime.day < 7) {
            return getWeekStr(msgTime);
          }
        }
      }
    }
    return msgTime.year.toString()+"/"+msgTime.month.toString()+"/"+msgTime.day.toString();
  }

  ///获取上下午
  static String getAMPMStr(DateTime value){

    return '';
  }

}