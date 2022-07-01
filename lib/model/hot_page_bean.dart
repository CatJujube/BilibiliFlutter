import 'dart:core';

import 'package:bilibili_flutter/model/base_page_bean.dart';

class HotPageVideoCardBean{
  String coverUrl = "";
  String videoUrl = "";
  String title = "";
  String palyTag = "";  //如 "百万播放量" "5万点赞等"
  String upName = "";
  int playTimes = 0;  //播放量
  int date = 0; //时间
}

class HotPageBean extends BasePageBean{
  List<HotPageVideoCardBean> videoList = [];
}