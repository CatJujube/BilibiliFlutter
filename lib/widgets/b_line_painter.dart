import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLinePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..isAntiAlias = false
        ..strokeWidth = 5
        ..color = Colors.grey;
    canvas.drawLine(Offset(0.0,0.0), Offset(0,5), paint..strokeCap);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}