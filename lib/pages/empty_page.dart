import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyPage extends StatefulWidget {
   EmptyPage(this.topBarTitle,{Key? key}) : super(key: key);

  String topBarTitle = "";

  @override
  _EmptyPageState createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LoginAppBar(widget.topBarTitle),
      body: mainBody(),
    );
  }

  Widget mainBody(){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("lib/images/empty_page/empty_icon.png",width: 150,height: 150,),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text("功能还没上线呢~",style: TextStyle(color: Colors.grey,fontSize: FontSize.FONT_SIZE_SAMLL),)
        ],
      ),
    );
  }
}
