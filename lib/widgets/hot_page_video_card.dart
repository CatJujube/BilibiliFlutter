import 'package:bilibili_flutter/model/hot_page_bean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotPageVideoCard extends StatefulWidget {
  HotPageVideoCard(this.bean,{Key? key}) : super(key: key);
  HotPageVideoCardBean bean;
  @override
  _HotPageVideoCardState createState() => _HotPageVideoCardState();
}

class _HotPageVideoCardState extends State<HotPageVideoCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex:1,child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(3),

          ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(widget.bean.coverUrl,fit: BoxFit.fill)
        )),
        Expanded(flex:1,
            child: Column(
            children: [
              Text(widget.bean.title),
              Text(widget.bean.upName),
              Text("179万观看 06-29")
            ],
        )
        )],
    );
  }
}
