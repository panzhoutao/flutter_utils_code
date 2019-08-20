import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils_code/flutter_utils_code.dart';

///正则
class RegexPage extends StatefulWidget {
  RegexPage({Key key}) : super(key: key);

  @override
  _RegexPageState createState() => _RegexPageState();
}

class _RegexPageState extends State<RegexPage> {
  String _phoneHint = '请填写手机号';
  String _mailHint = '请填写邮箱';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app相关'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            '简单验证手机号',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            onChanged: (str) {
              setState(() {
                if (str.isEmpty) {
                  _phoneHint = '请填写手机号';
                } else if (RegexUtils.isMobileSimple(str)) {
                  _phoneHint = '是手机号';
                } else {
                  _phoneHint = '不是手机号';
                }
              });
            },
            decoration: InputDecoration(
              hintText:'请输入手机号' ,
              labelText: '手机号' ,
              helperText: '提示：$_phoneHint',
            ),
            maxLines: 1,
            maxLength: 11,
            //键盘展示为号码
            keyboardType: TextInputType.phone,
            //只能输入数字
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '精准校验手机号',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            onChanged: (str) {
              setState(() {
                if (str.isEmpty) {
                  _phoneHint = '请填写手机号';
                } else if (RegexUtils.isMobileExact(str)) {
                  _phoneHint = '是手机号';
                } else {
                  _phoneHint = '不是手机号';
                }
              });
            },
            decoration: InputDecoration(
              hintText:'请输入手机号' ,
              labelText: '手机号' ,
              helperText: '提示：$_phoneHint',
            ),
            maxLines: 1,
            maxLength: 11,
            //键盘展示为号码
            keyboardType: TextInputType.phone,
            //只能输入数字
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '验证邮箱',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextField(
            onChanged: (str) {
              setState(() {
                if (str.isEmpty) {
                  _mailHint = '请填写邮箱';
                } else if (RegexUtils.isEmail(str)) {
                  _mailHint = '是邮箱';
                } else {
                  _mailHint = '不是邮箱';
                }
              });
            },
            decoration: InputDecoration(
              hintText:'请输入邮箱' ,
              labelText: '邮箱' ,
              helperText: '提示：$_mailHint',
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
