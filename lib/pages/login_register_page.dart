import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/values/colors.dart';
import 'package:bilibili_flutter/values/strings.dart';
import 'package:bilibili_flutter/widgets/app_bar.dart';
import 'package:bilibili_flutter/widgets/common_button.dart';
import 'package:bilibili_flutter/widgets/common_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}
enum PageType{
  SHORT_MESSAGE_LOGIN_PAGE,
  PASSWORD_LOGIN_PAGE

}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  double leftWidth = 84;
  double fontSize = FontSize.FONT_SIZE_NORMAL;
  PageType _pageType = PageType.SHORT_MESSAGE_LOGIN_PAGE;

  @override
  Widget build(BuildContext context) {
    return mainBody();
  }

  Widget topBar(){
    if(_pageType == PageType.SHORT_MESSAGE_LOGIN_PAGE){
      return LoginAppBar(BString.login_top_bar_title,rightText: BString.login_top_bar_password_login,onRightTap: (){
        setState(() {
          _pageType = PageType.PASSWORD_LOGIN_PAGE;
        });
      },);
    }else{
      return LoginAppBar(BString.login_top_bar_password_login,rightText: BString.login_top_bar_short_message,onRightTap: (){
        setState(() {
          _pageType = PageType.SHORT_MESSAGE_LOGIN_PAGE;
        });
      });
    }
  }

  Widget mainBody(){
    VoidCallback? onPasswordLoginClick = (){
        setState(() {
          _pageType = PageType.PASSWORD_LOGIN_PAGE
        });
    };

    if(_pageType == PageType.SHORT_MESSAGE_LOGIN_PAGE){
      return Scaffold(
        appBar: LoginAppBar(BString.login_top_bar_title,rightText: BString.login_top_bar_password_login,onRightTap: onPasswordLoginClick,),
        body: loginRegisterBody(),
      );
    }else{
      return Scaffold(
          appBar: LoginAppBar(BString.login_top_bar_password_login,rightText: BString.login_top_bar_short_message,onRightTap: (){
            setState(() {
              _pageType = PageType.SHORT_MESSAGE_LOGIN_PAGE;
            });
          },),
          body: passwordLoginBody(() { })
      );
    }
  }

  Widget passwordLoginBody(VoidCallback? onShortMessageLoginClick){
    return Container(
      child: Column(
        children: [
          Container(
            child: accountCell(),
            margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN,right: BSpan.DEFAULT_RIGHT_SPAN),
          ),
          Container(
            child: passwordCell(),
            margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN,right: BSpan.DEFAULT_RIGHT_SPAN),
          ),
          Container(
            child: RegisterAndLoginCell(onShortMessageLoginClick),
            margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN,top:40,right: BSpan.DEFAULT_RIGHT_SPAN),
          )
        ],
      ),
    );
  }

  Widget accountCell(){
    return Container(
      child: Row(
        children: [
          Container(
            child:Text(BString.login_account,
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSize,
              ),
            ),
            width: leftWidth,
          ),
          Expanded(child: TextField(
            cursorColor: Colors.pinkAccent,
            style: TextStyle(
                fontSize: fontSize
            ),
            decoration: InputDecoration(
                hintText: BString.login_account_hint,
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: InputBorder.none
            ),
          ))
        ],
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: BColor.DEFALUT_UNDERLINE_GRAY))
      ),
    );
  }

  Widget passwordCell(){
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: BColor.DEFALUT_UNDERLINE_GRAY))
      ),
      child: Row(
        children: [
          Container(
            width: leftWidth,
            child: Text(BString.login_password,
              style: TextStyle(
                  fontSize: FontSize.FONT_SIZE_NORMAL
              ),
            ) ,
          ),
          Expanded(child: TextField(
            style: TextStyle(
                fontSize: FontSize.FONT_SIZE_NORMAL
            ),
            cursorColor: Colors.pinkAccent,
            decoration: InputDecoration(
                hintText: BString.login_password_hint,
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: InputBorder.none
            ),
          ),
          ),
          Container(
            child: Text(
              BString.login_forget_password,
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: FontSize.FONT_SIZE_NORMAL
              ),
            ),
            width: 84,
          )
        ],
      ),
    );
  }

  Widget RegisterAndLoginCell(VoidCallback? onTap){
    return Container(
      child: Row(
        children: [
          Expanded(flex: 1,child: registerButton(onTap)),
          Padding(padding: EdgeInsets.only(right: 10)),
          Expanded(flex: 1,child: loginButton((){
            //todo 登陆按钮
          }))
        ],
      ),
    );
  }

  Widget registerButton(VoidCallback? onTap){
    return Container(
      height: BButton.BUTTON_HEIGHT_NORMAL,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)
        ),
        child: Text(BString.register,
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.pinkAccent
          ),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.pinkAccent,width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(1.0))
      ),
    );
  }

  Widget loginButton(VoidCallback? onTap){
    return Container(
      child: CommonButton(
        BString.login,
        onTap,
        height: BButton.BUTTON_HEIGHT_NORMAL,
      ),
    );
  }

  Widget loginRegisterBody(){
    return Column(
      children: [
        CommonCell(BString.login_location),
        Container(
          child: phoneNumberEditCellV2(),
        ),
        Container(
          child: verifyCodeCell(),
          margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN,right: BSpan.DEFAULT_RIGHT_SPAN),
        ),
        Container(
          margin: EdgeInsets.only(left:BSpan.DEFAULT_LEFT_SPAN,right: BSpan.DEFAULT_RIGHT_SPAN,top: 20,bottom: 20),
          child:CommonButton(BString.login_verfiy_code,
                  (){
                //todo 验证码登陆点击事件
              },
              enable: false,
              height: BButton.BUTTON_HEIGHT_NORMAL,
              width: double.infinity),
        )
    ],
    );
  }

  Widget phoneNumberEditCellV2(){

    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: BColor.DEFALUT_UNDERLINE_GRAY))
      ),
      margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN,right: BSpan.DEFAULT_RIGHT_SPAN),
      child: Row(
        children: [
          Container(
            width: leftWidth,
            child: Text(BString.login_phone_prefix,
              style: TextStyle(
                  fontSize: FontSize.FONT_SIZE_NORMAL
              ),
            ) ,
          ),
          Expanded(child: TextField(
            cursorColor: Colors.pinkAccent,
            style: TextStyle(
                fontSize: FontSize.FONT_SIZE_NORMAL
            ),
            decoration: InputDecoration(
                hintText: BString.login_phone_hint,
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                border: InputBorder.none
            ),
          ),
          ),
          Container(
            child: Text(
              BString.login_verify_code_short,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: FontSize.FONT_SIZE_NORMAL
              ),
            ),
            width: 100,
          )
        ],
      ),
    );
  }

  Widget verifyCodeCell(){
    return Container(
       child: Row(
          children: [
            Container(
              child:Text(BString.login_verfiy_code2,
                style: TextStyle(
                    fontSize: fontSize
                ),
              ),
              width: leftWidth,
            ),
            Expanded(child: TextField(
              cursorColor: Colors.pinkAccent,
              style: TextStyle(
                fontSize: fontSize
              ),
              decoration: InputDecoration(
                  hintText: BString.login_verify_hint,
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  border: InputBorder.none
              ),
            ))
          ],
       ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: BColor.DEFALUT_UNDERLINE_GRAY))
      ),
    );
  }
}
