import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatefulWidget {
  VideoCard(this.url,this.title,this.upName,this.onVideoTap,this.onMoreTap,{Key? key,this.margin,this.color,this.elevation,this.radius = 5}) : super(key: key);

  String? url;
  String? title;
  String? upName;
  EdgeInsets? margin;
  Color? color;
  double? elevation;
  double radius;
  VoidCallback? onVideoTap;
  VoidCallback? onMoreTap;

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onVideoTap,
      child: Card(
        margin: widget.margin,
        color: widget.color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius))
        ),
        elevation: widget.elevation,
        child: Column(
          children: [
            RoundImage(widget.radius, widget.url),
            videoTitle(),
            Expanded(child: userName()),
          ],
        ),
      )
    );
  }

  Widget RoundImage(double radius,String? url){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(radius)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(url ?? "",fit: BoxFit.fill,),
    );
  }

  Widget videoTitle(){
    return Container(
      margin: EdgeInsets.all(4),
      child: Text(widget.title ?? "",style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLLEST,color: Colors.black),),
    );
  }

  Widget userName(){
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.orangeAccent[100],
                borderRadius: BorderRadius.circular(3),
            ),
            padding: EdgeInsets.only(left:2,right: 2,top: 1,bottom: 2),
            margin: EdgeInsets.only(left: 5,right: 5),
            child: Text(
                "竖屏",
                style: TextStyle(fontSize: FontSize.FONT_SIZE_SAMLLEST,
                  color: Colors.deepOrange[700],fontWeight: FontWeight.normal,)
            )),
        Expanded(child: Text(widget.upName ?? "",
          style: TextStyle(
              fontSize: FontSize.FONT_SIZE_SAMLLEST,
              color: Colors.grey[400]
          ),)),
        Container(
          child: IconButton(icon: Icon(Icons.more_vert,size: 15,color: Colors.grey[400]),
              onPressed: widget.onMoreTap,
            iconSize: 15,
            padding: EdgeInsets.all(2),
          ),
        )
      ],
    );
  }
}
