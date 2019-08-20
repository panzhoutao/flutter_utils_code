import 'package:flutter/material.dart';

import 'view/app_about.dart';
import 'view/regex.dart';
import 'view/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Utils Code Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Wrap(
            //水平方向间距
            spacing: 20.0,
            //垂直方向间距
            runSpacing: 12.0,
            children: <Widget>[
              _getWrapChildren ("toast" , ToastPage()),
              _getWrapChildren ("正则相关" , RegexPage()),
              _getWrapChildren ("app相关" , AppAbout()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getWrapChildren (String str, Widget page , ){
    return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: new Text(str),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
