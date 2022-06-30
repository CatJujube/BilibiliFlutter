import 'package:bilibili_flutter/utils/navigation_utils.dart';
import 'package:bilibili_flutter/widgets/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage(this.imgs,this.videoList,{Key? key}) : super(key: key);
  List<String> imgs=[
    'http://xxxx/img1.jpg',
    'http://xxxx/img2.jpg',
    'http://xxxx/img3.jpg',
    'http://xxxx/img4.jpg'
  ];

  List<String> videoList = [];

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        swiper(),
        GridView(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
          children: buildVideoList(widget.videoList),
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  Widget swiper(){
    return Container(
      height: 200,
      margin: EdgeInsets.all(4),
      child: new Swiper(
        itemBuilder: (BuildContext context,int index){
          return RoundImage(5, widget.imgs[index]);
        },
        itemCount: widget.imgs.length,
        pagination: new SwiperPagination(),//如果不填则不显示指示点
        // control: new SwiperControl(),//如果不填则不显示左右按钮
      ),
    );
  }

  List<Widget> buildVideoList(List<String> videos){
    List<Widget> ret = [];
    videos.forEach((url) {
      ret.add(
        Container(
          child: VideoCard(url,"从校服到婚纱，我们共同成长的14年很长很长。","司同学和韩豆豆很长很长很长",(){
            NavigationUtils.navToEmptyPage(context, "视频");
          },(){
            NavigationUtils.navToEmptyPage(context, "更多");
          }),
        )
      );
    });
    return ret;
  }

  Widget RoundImage(double radius,String? url){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(radius)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(url ?? "",fit: BoxFit.fill,),
    );
  }
}
