import 'package:bilibili_flutter/pages/empty_page.dart';
import 'package:flutter/cupertino.dart';

class NavigationUtils{
  static void navToEmptyPage(BuildContext context,String title){
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EmptyPage(title)
      ),
    );
  }

  static void navTo(BuildContext context, Widget page){
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => page
      ),
    );
  }
}