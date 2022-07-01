import 'package:bilibili_flutter/model/hot_page_bean.dart';
import 'package:bilibili_flutter/widgets/hot_page_video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HotPage extends StatefulWidget {
  HotPage(this.beans,{Key? key}) : super(key: key);
  List<HotPageVideoCardBean> beans;
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buildVedioList(widget.beans)
    );
  }

  Widget catogeryTabs(){
    return Container(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Container(
              width: 24,
              height: 24,
              child:CircleAvatar(child: ImageIcon(AssetImage("lib/images/collect.png")))
          ),
          Container(
              width: 24,
              height: 24,
              child:CircleAvatar(child: ImageIcon(AssetImage("lib/images/collect.png")))
          ),
          Container(
              width: 24,
              height: 24,
              child:CircleAvatar(child: ImageIcon(AssetImage("lib/images/collect.png")))
          ),
          Container(
              width: 24,
              height: 24,
              child:CircleAvatar(child: ImageIcon(AssetImage("lib/images/collect.png")))
          ),
        ],
      )
    );

  }

  List<Widget> buildVedioList(List<HotPageVideoCardBean> beans){
    List<Widget> retList = [];
    retList.add(catogeryTabs());
    beans.forEach((bean) {
      retList.add(
        Container(
          child: HotPageVideoCard(bean),
        )
      );
    });
    return retList;
  }
}
