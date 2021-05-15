import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class JsonUtil {
  //带有首行缩进的Json格式
  static JsonEncoder encoder = JsonEncoder.withIndent('  ');

  /// 单纯的Json格式输出打印
  static void printJson(Object object) {
    try {
      var encoderString = encoder.convert(object);
      // print(encoderString);
      // 不使用print()方法是因为这是单条输出，如果过长无法显示全
      // 所以使用debugPrint()
      debugPrint(encoderString);
      // 下面这语句的效果与debugPrint 相同
      //prettyString.split('\n').forEach((element) => print(element));
    } catch (e) {
      print(e);
    }
  }

  /// 接收Dio请求库返回的Response对象
  static void printRespond(Response? response) {
    if(response == null){
      return;
    }
    Map httpLogMap = Map();
    httpLogMap.putIfAbsent("requestUrl", () => "${response.requestOptions.uri}");
    httpLogMap.putIfAbsent("requestHeaders", () => response.requestOptions.headers);
    httpLogMap.putIfAbsent("requestethod", () => "${response.requestOptions.method}");
    httpLogMap.putIfAbsent(
        "requestQueryParameters", () => response.requestOptions.queryParameters);
    // if(response.request is FormData){
    //   httpLogMap.putIfAbsent(
    //       "requestData", () => (response.request.data as FormData).toString());
    // }else {
    //   httpLogMap.putIfAbsent(
    //       "requestData", () => response.request.data);
    // }
    httpLogMap.putIfAbsent(
        "requestData", () => response.requestOptions.data.toString());
    httpLogMap.putIfAbsent("respondData", () => response.data);
    printJson(httpLogMap);
  }
}
