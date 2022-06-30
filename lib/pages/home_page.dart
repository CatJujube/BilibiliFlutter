import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/model/home_page_model.dart';
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
  HomePageModel _model = HomePageRepo().mockData();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _model.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_){
    //   Overlay.of(context)?.insert(this._tabBarOverlay(() {
    //     NavigationUtils.navToEmptyPage(context, "");
    //   }));
    // });
    return Scaffold(
      appBar: SAppBarSearch(
        leading: InkWell(
           child: CircleAvatar(child: Text("登陆",style: TextStyle(color: Colors.pinkAccent,
               fontSize: FontSize.FONT_SIZE_SAMLL,
               fontWeight: FontWeight.bold),),
             backgroundColor: Colors.grey[100],),
          onTap: (){
             NavigationUtils.navTo(context, LoginRegisterPage());
          },
        ),

        bottom: RightButtonTabBar(
          controller:_tabController,
          tabs: _model.tabs.map((e){
            return Container(
              child: RightButtonTab(text: e),
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
        children: _model.tabs.map((e) {
          return Container(
              alignment: Alignment.center,
              child: RecommendPage(swiperList,videoList),
            );
        }).toList(),
      ),
    );
  }

  List<String> swiperList = ["https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp"
  ];

  List<String> videoList = ["https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp",
    "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp"
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
