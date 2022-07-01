import 'package:bilibili_flutter/model/base_page_bean.dart';
import 'package:bilibili_flutter/model/home_page_tab_bean.dart';
import 'package:bilibili_flutter/model/hot_page_bean.dart';
import 'package:bilibili_flutter/model/live_page_tab_bean.dart';

class HomePageRepo{

  List<RecommendPageBean> requestData(){
    return  [RecommendPageBean()];
  }

  List<BasePageBean> mockData(){
    return [
      mockRecommendPageData(),
      mockHotPageData()];
  }

  BasePageBean mockRecommendPageData(){
    //mock recommend page数据
    RecommendPageBean recommendData = RecommendPageBean();
    recommendData.tabType = HomePageTabType.RECOMMEND_TAB;
    recommendData.slidBeanList =[
      SlidShowBean("https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp")
    ];
    for(int i=0;i<100;++i){
      recommendData.videoCardBeanList.add(VideoCardBean(
          "https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp",
          "从校服到婚纱，共同成长14年",
          "司同学和韩豆豆"
      ));
    }
    return recommendData;
  }

  BasePageBean mockLivePageData(){
    LivePageBean livePageBean = LivePageBean();
    livePageBean.slidList = [
      SlidShowBean("https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/35a01a40de7c96f5b316329ff4fe3cf29a71ddae.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/df5a6193710fa649f0bd5274964f10181fe8f779.png@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/bfaeba881c7f14ffafd9ff37d005a090203d8202.jpg@976w_550h_1c.webp"),
      SlidShowBean("https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp")
    ];

    return livePageBean;
  }

  BasePageBean mockHotPageData(){
    HotPageBean hotPageBean = HotPageBean();
    hotPageBean.tabType = HomePageTabType.HOT_TAB;
    HotPageVideoCardBean cardBean = HotPageVideoCardBean();
    cardBean.upName = "是老胡没错";
    cardBean.title = "没有人会喜欢夏天的";
    cardBean.coverUrl = "https://i0.hdslb.com/bfs/banner/92392ba1d5d6d7ae595cdaa9029fdba920536140.png@976w_550h_1c.webp";
    for(int i=0;i<100;++i){
      hotPageBean.videoList.add(cardBean);
    }
    return  hotPageBean;
  }

}

