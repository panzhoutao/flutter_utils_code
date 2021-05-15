import 'package:flutter/material.dart';

///String扩展：
extension StringExt on String {
  double toDouble() {
    return double.parse(this);
  }

  int toInt() {
    return int.parse(this);
  }

  bool isMobile() {
    return RegExp(r'^((1[0-9][0-9]))\d{8}$').hasMatch(this);
    // return RegExp(r'^((13[0-9])|(14[5,7,9])|(15[^4])|(18[0-9])|(17[0-9])|(19)[0-9])\d{8}$').hasMatch(this);
  }

  bool isEmptyOrNull() {
    return this == null || this.trim().isEmpty;
  }

  ///用逗号隔开的string 转为 list
  List<String> fromCommaToList(){
    if(this.isEmptyOrNull()){
      return [];
    }else {
      return this.split(',');
    }
  }

}

///double扩展
extension DoubleExt on num {
  String toMyStringAsFixed(int fractionDigits) {
    if (this == null || this == 0) {
      return '0';
    }
    return this.toStringAsFixed(fractionDigits);
  }

  ///区分int 和 double
  /// 例如 1.2 -> 1.2  , 1.0 -> 1
  String toMyDouble(int fractionDigits){
    if(this%1 == 0){
      return '${this.toInt()}';
    } else {
      return this.toStringAsFixed(fractionDigits);
    }
  }

}

///widget扩展
extension WidgetExt on Widget {

  Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget expand() {
    return Expanded(child: this);
  }

  Widget center(){
    return Center(child: this);
  }

  Widget align(AlignmentGeometry alignmentGeometry){
    return Align(alignment: alignmentGeometry,child: this,);
  }

}

///list扩展
extension ListExt on List {

  ///逗号隔开的字符串
  String toCommaStr(){
    List tempList = [];
    String str = '';
    this.forEach((f){
      tempList.add(f);
    });

    tempList.forEach((f){
      if(str == ''){
        str = "$f";
      }else {
        str = "$str"",""$f";
      }
    });

    return str;
  }

}
