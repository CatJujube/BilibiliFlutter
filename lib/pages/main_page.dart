import 'package:bilibili_flutter/pages/empty_page.dart';
import 'package:bilibili_flutter/pages/home_page.dart';
import 'package:bilibili_flutter/pages/mine_info_page.dart';
import 'package:bilibili_flutter/utils/navigation_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [HomePage(), EmptyPage("动态"), EmptyPage("会员购"), MineInfoPage()];
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
        selectedItemColor: Colors.pinkAccent,
      ),
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NavigationUtils.navToEmptyPage(context,"发布");
        },
          backgroundColor: Colors.pinkAccent,
        child:       Icon(Icons.add,color: Colors.white)
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  static final double iconSize= 24;

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/home_page/home-page.png"),size: iconSize,) ,
      label: "首页",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/home_page/cross_car.png"),size: iconSize,) ,
      label: "动态",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/home_page/home_page_buy.png"),size: iconSize,) ,
      label: "会员购",
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: ImageIcon(AssetImage("lib/images/home_page/mine.png"),size: iconSize,) ,
      label: "我的",
    ),
  ];
}
