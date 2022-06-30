
import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAppBar extends StatefulWidget with PreferredSizeWidget{
  LoginAppBar(this.title,{Key? key,this.rightText="" ,this.onRightTap}) : super(key: key);

  String title = "";
  String rightText = "";
  VoidCallback? onRightTap = (){};

  @override
  _LoginAppBarState createState() => _LoginAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _LoginAppBarState extends State<LoginAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
      },),
      title: Text(widget.title,style: TextStyle(
          fontSize: FontSize.FONT_SIZE_NORMAL,
          fontWeight: FontWeight.w400,
          color: Colors.black
      )),
      actions: [
        Padding(padding: EdgeInsets.only(right: BPadding.DEFAULT_RIGHT_PADDING),
            child:Center(
              child: GestureDetector(
                onTap: widget.onRightTap,
                child: Text(widget.rightText,style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLL,color: BColor.DEFALUT_TEXT_GRAY),),
              ),
            )
        )
      ],
    );
  }
}
