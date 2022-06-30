import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/pages/empty_page.dart';
import 'package:bilibili_flutter/pages/login_register_page.dart';
import 'package:bilibili_flutter/utils/navigation_utils.dart';
import 'package:bilibili_flutter/values/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MineInfoPage extends StatefulWidget {
  const MineInfoPage({Key? key}) : super(key: key);

  @override
  _MineInfoPageState createState() => _MineInfoPageState();
}

enum MineInfoPageType{
  LOGIN_PAGE_TYPE,
  UNLOGIN_PAGE_TYPE
}

class _MineInfoPageState extends State<MineInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: mainBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget mainBody(){
    return ListView(
      children: [
        Container(
          child: HeaderLoginCell(),
          margin: EdgeInsets.only(top: 20,bottom: 20),
        ),
        Container(
          child: pageCell2(),
          margin: EdgeInsets.only(top: 0,bottom: 0),
        ),
        Container(
          child: pageCell3(),
          margin: EdgeInsets.only(top: 20,bottom: 20),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(BString.mineinfo_recommend_service,style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLL,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          margin: EdgeInsets.only(top: 0,left:BSpan.DEFAULT_LEFT_SPAN,bottom: 0,right: BSpan.DEFAULT_RIGHT_SPAN),
        ),
        Container(
          child: gridViewCell(),
          margin: EdgeInsets.only(top: 0,left:BSpan.DEFAULT_LEFT_SPAN,bottom: 20,right: BSpan.DEFAULT_RIGHT_SPAN),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(BString.mineinfo_more_service,style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLL,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
          margin: EdgeInsets.only(top: 0,left:BSpan.DEFAULT_LEFT_SPAN,bottom: 20,right: BSpan.DEFAULT_RIGHT_SPAN),
        ),
        Container(
          child: pageCell5(),
          margin: EdgeInsets.only(top: 0,left:BSpan.DEFAULT_LEFT_SPAN,bottom: 20,right: BSpan.DEFAULT_RIGHT_SPAN),
        )
      ],
    );
  }

  AppBar appBar(){
    return AppBar(
      elevation: 0.0,
      actions: [
        ActionIcon("lib/images/tv.png",24,(){
          NavigationUtils.navToEmptyPage(context, "");
        }),
        ActionIcon("lib/images/scan.png",24,(){
          NavigationUtils.navToEmptyPage(context, "");
        }),
        ActionIcon("lib/images/cothes.png",24,(){
          NavigationUtils.navToEmptyPage(context, "");
        }),
        Container(
        width: 20,
        height: 20,
        margin: EdgeInsets.only(right: 16),
        child: GestureDetector(
        child: ImageIcon(AssetImage("lib/images/moon.png")),
          onTap: (){
            NavigationUtils.navToEmptyPage(context, "");
          },
          )
        )
      ],
    );
  }

  Widget ActionIcon(String img,double marginRight,VoidCallback? onTap){
     return Container(
       width: 24,
       height: 24,
       margin: EdgeInsets.only(right: marginRight),
       child: GestureDetector(
         child: ImageIcon(AssetImage(img)),
         onTap: onTap,
       )
     );
  }

  Widget HeaderLoginCell(){
    return Container(
      margin: EdgeInsets.only(left: BSpan.DEFAULT_LEFT_SPAN),
      child: InkWell(
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                    "lib/images/login_avator.png"
                ),
              ),
              margin: EdgeInsets.only(right: 16),
            ),
            Expanded(child: Text(BString.click_login,style: TextStyle(
              fontSize: FontSize.FONT_SIZE_NORMAL
            ),)),
            IconButton(onPressed: (){
              navToLoginRegisterPage();
            }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 14,),
            color: Colors.grey,)
          ],
        ),
        onTap: navToLoginRegisterPage,
      )
    );
  }

  void navToLoginRegisterPage(){
    Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => new LoginRegisterPage())
    );
  }

  Widget pageCell2(){
    return Container(
      child: Row(
        children: [
          Expanded(flex: 1,child: twoLevelCell(0, BString.mineinfo_dynamic)),
          SizedBox(width: 1,height: 16,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey[300]))),
          Expanded(flex: 1, child: twoLevelCell(0, BString.mineinfo_follow)),
          SizedBox(width: 1,height: 16,child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey[300]))),
          Expanded(flex: 1,child: twoLevelCell(0, BString.mineinfo_fans))
        ],
      ),
    );
  }

  Widget twoLevelCell(int count,String desc ){
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(count==0 ? "-":count.toString(),style: TextStyle(fontSize: FontSize.FONT_SIZE_NORMAL,color: Colors.black),),
          Text(desc,style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLL,color: Colors.grey),)
        ],
      ),
    );
  }

  //离线缓存，历史记录，我的收藏，稍后再看
  Widget pageCell3(){
    return Container(
      child: Row(
        children: [
          Expanded(flex:1,child: twoLevelCellWithIcon("lib/images/offline_cache.png",BString.mineinfo_offline_cache,(){
            NavigationUtils.navToEmptyPage(context, BString.mineinfo_offline_cache);
          })),
          Expanded(flex:1,child: twoLevelCellWithIcon("lib/images/his_record.png",BString.mineinfo_offline_his_record,(){
            NavigationUtils.navToEmptyPage(context, BString.mineinfo_offline_his_record);
          })),
          Expanded(flex:1,child: twoLevelCellWithIcon("lib/images/collect.png",BString.mineinfo_offline_my_collection,(){
            NavigationUtils.navToEmptyPage(context, BString.mineinfo_offline_my_collection);
          })),
          Expanded(flex:1,child: twoLevelCellWithIcon("lib/images/later_see.png",BString.mineinfo_offline_later_see,(){
            NavigationUtils.navToEmptyPage(context, BString.mineinfo_offline_my_collection);
          })),
        ],
      ),
    );
  }

  Widget twoLevelCellWithIcon(String imgPath,String desc,VoidCallback? onTap){
    return Container(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(imgPath),color: Colors.blue,),
            Text(desc,style: TextStyle(
                fontSize: FontSize.FONT_SIZE_SAMLL,
                color: Colors.grey[700]
            ))
          ],
        ),
        onTap: onTap,
      ));
  }

  Widget gridViewCell(){
    return Container(
     child: GridView(
       shrinkWrap: true,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 4,
         childAspectRatio: 8/7
       ),
       children: [
         gridIcon("lib/images/recommend_service/my_course.png", BString.mineinfo_my_course, () { navToEmptyPage(BString.mineinfo_my_course); }), //我的课程
         gridIcon("lib/images/recommend_service/phone_card.png", "免流量服务", () {navToEmptyPage("免流量服务"); }),
         gridIcon("lib/images/cothes.png", "个性装扮", () {navToEmptyPage("个性装扮"); }),
         gridIcon("lib/images/recommend_service/my_wallet.png", "我的钱包", () { navToEmptyPage("我的钱包");}),
         gridIcon("lib/images/recommend_service/play_game.png", "游戏中心", () { navToEmptyPage("游戏中心");}),
         gridIcon("lib/images/recommend_service/vip_buy.png", "会员购物中心", () {navToEmptyPage("会员购物中心"); }),
         gridIcon("lib/images/recommend_service/online_center.png", "直播中心", () {navToEmptyPage("直播中心"); }),
         gridIcon("lib/images/recommend_service/message.png", "社区中心", () { navToEmptyPage("社区中心");}),
         gridIcon("lib/images/recommend_service/bilibili_benifit.png", "哔哩哔哩公益", () { navToEmptyPage("哔哩哔哩公益");}),
       ],
     ),
    );
  }

  Widget gridIcon(String imgPath, String desc,VoidCallback? onTap){
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(imgPath,),color: Colors.pinkAccent,),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text(desc,style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLL,color: Colors.grey[700]),)
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget pageCell5(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cell5Icon("lib/images/customer_service.png","联系客服", () {
            navToEmptyPage("联系客服");
          }), //联系客服
          cell5Icon("lib/images/setting.png","设置",() {
            navToEmptyPage("设置");
          }), //设置
          cell5Icon("lib/images/plant.png", "青少年守护", () {
            navToEmptyPage("青少年守护");
          })
        ],
      ),
    );
  }

  Widget cell5Icon(String imgPath,String desc,VoidCallback? onTap){
    return Container(
      height: 34,
      child: InkWell(
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageIcon(AssetImage(imgPath),color: Colors.pinkAccent,),
            Padding(padding: EdgeInsets.only(right: 10)),
            Expanded(child: Text(desc,style: TextStyle(
                fontSize: FontSize.FONT_SIZE_SAMLL
            ),)),
            IconButton(onPressed: (){
              onTap;
            }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 14,),
              color: Colors.grey,)
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  void navToEmptyPage(String title){
    Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => new EmptyPage(title))
    );
  }
}
