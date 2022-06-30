import 'package:bilibili_flutter/model/home_page_model.dart';

class HomePageRepo{

  HomePageModel requestData(){
    return HomePageModel();
  }

  HomePageModel mockData(){
    HomePageModel data = HomePageModel();
    data.tabs = ["直播","推荐","热门","动画","影视","共同抗疫","新征程"];
    return data;
  }

}

