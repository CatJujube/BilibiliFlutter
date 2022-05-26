import 'package:bilibili_flutter/values/strings.dart';
import 'package:bilibili_flutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(BString.login_top_bar_title,rightText: BString.login_top_bar_password_login,),
    );
  }
}
