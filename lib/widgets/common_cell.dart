import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:bilibili_flutter/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonCell extends StatefulWidget {

  String leftText = "";
  String midText = "";
  bool isShowArrow =  false;
  VoidCallback? onClik = (){};

  @override
  _CommonCellState createState() => _CommonCellState();

  CommonCell(this.leftText, {this.midText="", this.isShowArrow=false, this.onClik});
}

class _CommonCellState extends State<CommonCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Text(widget.leftText,
              style: TextStyle(
                fontSize: FontSize.FONT_SIZE_NORMAL
              ),
            ),
            left: BSpan.DEFAULT_LEFT_SPAN,
          ),
          Positioned(
            child: IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            iconSize: 14,
            onPressed: widget.onClik,
            ),
            right: BSpan.DEFAULT_RIGHT_SPAN,
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1,color: BColor.DEFALUT_UNDERLINE_GRAY))
      ),
      constraints: BoxConstraints.tightFor( height: CellSize.CELL_HEIGHT_NORMAL,width:double.infinity),
    );
  }
}
