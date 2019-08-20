import 'package:flutter/material.dart';
import 'package:flutter_utils_code/flutter_utils_code.dart';

///toast
class ToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('toast'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: new Text('普通toast'),
            onPressed: () {
              Toast.show('就是随便toast', context);
            },
          )
        ],
      ),
    );
  }
}
