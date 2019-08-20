import 'package:flutter/material.dart';
import 'package:flutter_utils_code/flutter_utils_code.dart';

///app相关
class AppAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app相关'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text('是否debug模式：${AppUtils.isAppDebug()}'),
        ],
      ),
    );
  }
}
