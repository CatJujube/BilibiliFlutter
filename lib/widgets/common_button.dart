import 'package:bilibili_flutter/model/b_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommonButton extends StatefulWidget {
  CommonButton(this.title,this.onTap,{Key? key,
    this.textColor=Colors.white,
    this.backgroundColor=Colors.pinkAccent,
    this.fontSize =  FontSize.FONT_SIZE_NORMAL,
    this.width = double.infinity,
    this.height = CellSize.CELL_HEIGHT_NORMAL,
    this.isBlod = false,
    this.enable = true
  }) : super(key: key);

  VoidCallback onTap =  (){};
  String title = "";
  Color textColor = Colors.white;
  Color backgroundColor = Colors.pinkAccent;
  double fontSize = FontSize.FONT_SIZE_NORMAL;
  double width = double.infinity;
  double height = CellSize.CELL_HEIGHT_NORMAL;
  bool isBlod;
  bool enable;
  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return
      ConstrainedBox(constraints: BoxConstraints(
          minWidth: widget.width,
          minHeight: widget.height
      ),
        child: ElevatedButton(
          onPressed: widget.enable ? widget.onTap:null,
          child: Text(
            widget.title,
            style: TextStyle(
                color: widget.textColor,
                fontWeight: widget.isBlod? FontWeight.bold : FontWeight.normal,
                fontSize: widget.fontSize
            ),
          ),
          style: ButtonStyle(
            backgroundColor:widget.enable ? MaterialStateProperty.all(widget.backgroundColor):MaterialStateProperty.all(widget.backgroundColor.withOpacity(0.5)),
          ),
        ),
      );
  }
}
