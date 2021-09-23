import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
@Deprecated('建议在项目中创建相关类')
void showToast(String content, {ToastGravity gravity = ToastGravity.CENTER}) {
  Fluttertoast.showToast(
    msg: '$content',
    gravity: gravity,
    backgroundColor: Colors.black,
  );
}
