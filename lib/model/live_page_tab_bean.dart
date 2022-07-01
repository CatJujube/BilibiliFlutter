import 'package:bilibili_flutter/model/base_page_bean.dart';
import 'package:bilibili_flutter/model/home_page_tab_bean.dart';

class LivePageTabType{
  static const int RECOMMEND_TYPE = 0;
  static const int BEAUTY_GIRL_TYPE = 0;
  static const int LOL_TYPE = 0;
  static const int VIRTUAL_HOST_TYPE = 0;
  static const int KING_GLORY_TYPE = 0;
  static const int ENTERTAINMENT_TYPE = 0;
  static const int SINGLE_GAME_TYPE = 0;

  static String liveTypeMapping(int type){
      String title = "";
      switch(type){
        case RECOMMEND_TYPE:
          title = "推荐";
          break;
        case BEAUTY_GIRL_TYPE:
          title = "美女";
          break;
        case LOL_TYPE:
          title = "英雄联盟";
          break;
        case VIRTUAL_HOST_TYPE:
          title = "虚拟主播";
          break;
        case KING_GLORY_TYPE:
          title = "王者荣耀";
          break;
        case ENTERTAINMENT_TYPE:
          title = "娱乐";
          break;
        case SINGLE_GAME_TYPE:
          title = "单机游戏";
          break;
        default:
          break;
      }
      return title;
  }
}

class LivePageTabBean{
  int livePageType = 0;
  List<VideoCardBean> videoList = [];
}

class LivePageBean extends BasePageBean{
  List<SlidShowBean> slidList = [];
  List<LivePageTabBean> tabBeanList = [];
}

