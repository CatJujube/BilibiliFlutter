
import 'package:bilibili_flutter/model/base_page_bean.dart';

class HomePageTabType{
  static const int LIVE_TAB = 0; //直播
  static const int RECOMMEND_TAB = 1; //推荐
  static const int HOT_TAB = 2; //热点
  static const int CARTOON_TAB = 3; //动画
  static const int FILM_TAB = 4;  //电影
  static const int ANTI_EPIDEMIC_TAB = 5; //抗疫
  static const int NEW_JOURNEY_TAB = 6; //新征程

  static String tabTypeMapper(int tabType){
    String title = "";
    switch(tabType){
      case LIVE_TAB:
        title = "直播";
        break;
      case RECOMMEND_TAB:
        title = "推荐";
        break;
      case HOT_TAB:
        title = "热点";
        break;
      case CARTOON_TAB:
        title = "动画";
        break;
      case FILM_TAB:
        title = "电影";
        break;
      case ANTI_EPIDEMIC_TAB:
        title = "抗疫";
        break;
      case NEW_JOURNEY_TAB:
        title = "新征程";
        break;
      default:
        title = "";
    }
    return title;
  }
}

class SlidShowBean{
  SlidShowBean(this.url);
  String url="";
}

class VideoCardBean{
  VideoCardBean(this.url,this.title,this.userName);
  String url = "";
  String title = "";
  String userName = "";
}

class RecommendPageBean extends BasePageBean{
  List<SlidShowBean> slidBeanList = [];
  List<VideoCardBean> videoCardBeanList = [];
}

