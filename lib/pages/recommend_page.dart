import 'package:bilibili_flutter/model/home_page_tab_bean.dart';
import 'package:bilibili_flutter/utils/navigation_utils.dart';
import 'package:bilibili_flutter/widgets/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage(this.slidBeans,this.videoList,{Key? key}) : super(key: key);
  List<SlidShowBean> slidBeans;
  List<VideoCardBean> videoList;

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
          // mainAxisSpacing: 10,
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
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return RoundImage(5, widget.slidBeans[index].url);
        },
        itemCount: widget.slidBeans.length,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.grey
          )
        ),//如果不填则不显示指示点
        // control: new SwiperControl(),//如果不填则不显示左右按钮
      ),
    );
  }

  List<Widget> buildVideoList(List<VideoCardBean> videos){
    List<Widget> ret = [];
    videos.forEach((videoBean) {
      ret.add(
        Container(
          child: VideoCard(videoBean.url,videoBean.title,videoBean.userName,(){
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
