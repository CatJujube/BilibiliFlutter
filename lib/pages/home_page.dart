import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/model/base_page_bean.dart';
import 'package:bilibili_flutter/model/home_page_tab_bean.dart';
import 'package:bilibili_flutter/model/hot_page_bean.dart';
import 'package:bilibili_flutter/pages/empty_page.dart';
import 'package:bilibili_flutter/pages/hot_page.dart';
import 'package:bilibili_flutter/pages/recommend_page.dart';
import 'package:bilibili_flutter/pages/login_register_page.dart';
import 'package:bilibili_flutter/repo/home_page_repo.dart';
import 'package:bilibili_flutter/utils/navigation_utils.dart';
import 'package:bilibili_flutter/widgets/right_button_tab_bar.dart';
import 'package:bilibili_flutter/widgets/search_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<BasePageBean> tabPageList = HomePageRepo().mockData();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabPageList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SAppBarSearch(
        leading: InkWell(
           child: CircleAvatar(child: Text("登录",style: TextStyle(color: Colors.pinkAccent,
               fontSize: FontSize.FONT_SIZE_SAMLL,
               fontWeight: FontWeight.bold),),
             backgroundColor: Colors.grey[100],),
          onTap: (){
             NavigationUtils.navTo(context, LoginRegisterPage());
          },
        ),

        bottom: RightButtonTabBar(
          controller:_tabController,
          tabs: tabPageList.map((tabBean){
            return Container(
              child: RightButtonTab(text: HomePageTabType.tabTypeMapper(tabBean.tabType),),
            );
          }).toList(),
          indicatorColor: Colors.pinkAccent,
          isScrollable: true,
          indicatorPadding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
          labelColor: Colors.pinkAccent,
          unselectedLabelColor: Colors.grey[600],
          indicatorWeight: 3,
          labelPadding: EdgeInsets.only(top: 0,left:10,right:10,bottom: 0),
          rightIcon: IconButton(icon: Icon(Icons.menu,color: Colors.grey,),onPressed: (){
            NavigationUtils.navToEmptyPage(context, "");
          }),
        ),
        actions: [
          IconButton(onPressed: (){
            NavigationUtils.navToEmptyPage(context, "");
          }, icon: Icon(Icons.videogame_asset,color: Colors.grey,)),
          IconButton(onPressed: (){
            NavigationUtils.navToEmptyPage(context, "");
          }, icon: Icon(Icons.email,color: Colors.grey,))
        ],
      ),
      body: RightButtonTabBarView( //构建
        controller: _tabController,
        children: tabPageList.map((tabBean) {
          return Container(
              alignment: Alignment.center,
              child: tabBeanPageMapper(tabBean),
            );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget tabBeanPageMapper(BasePageBean tabBean){
    int type = tabBean.tabType;
    switch(type){
      case HomePageTabType.RECOMMEND_TAB:
        RecommendPageBean bean = tabBean as RecommendPageBean;
        return RecommendPage(bean.slidBeanList,bean.videoCardBeanList);
      case HomePageTabType.HOT_TAB:
        HotPageBean bean = tabBean as HotPageBean;
        return HotPage(bean.videoList);
      default:
        return EmptyPage("");
    }
  }

}
