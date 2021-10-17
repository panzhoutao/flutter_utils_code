import 'dart:async';

///@Description:
///@Author:         @Mr.pan
///@CreateDate:     2021/9/23

/// 函数防抖
/// [func]: 要执行的方法
/// [delay]: 要迟延的时长
/// Example:
/// Center(
///     child: RaisedButton.icon(
///       icon: Icon(Icons.add),
///       label: Text('防抖'),
///       onPressed: debounce(() {
///         if (!mounted) {
///           return;
///         }
///         setState(() {
///           _count++;
///         });
///       }),
///     ),
///   ),
Function debounce(
  Function func, [
  Duration delay = const Duration(milliseconds: 2000),
]) {
  Timer? timer;
  Function target = () {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
    timer = Timer(delay, () {
      func.call();
    });
  };
  return target;
}

/// 函数节流
///
/// [func]: 要执行的方法
Function throttle(
  Future Function()? func,
) {
  if (func == null) {
    return func!;
  }
  bool enable = true;
  Function target = () {
    if (enable == true) {
      enable = false;
      func().then((_) {
        enable = true;
      });
    }
  };
  return target;
}
