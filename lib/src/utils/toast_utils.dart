import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
void showToast(String content, {ToastGravity gravity = ToastGravity.CENTER}) {
  Fluttertoast.showToast(
    msg: '$content',
    gravity: gravity,
    backgroundColor: Colors.black,
  );
}