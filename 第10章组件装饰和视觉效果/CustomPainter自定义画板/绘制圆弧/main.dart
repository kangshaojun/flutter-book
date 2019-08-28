import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制圆弧示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制圆弧示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: SizedBox(
              width: 500.0,
              height: 500.0,
              child: CustomPaint(
                painter: LinePainter(),
              ),
            )),
      ),
    );
  }
}

//继承于CustomPainter并且实现CustomPainter里面的paint和shouldRepaint方法
class LinePainter extends CustomPainter {
  //定义画笔
  Paint _paint = Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 2.0//画笔粗细
    ..style = PaintingStyle.stroke; //用于绘制点时PaintingStyle值无效

  //重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    //绘制圆弧
    const PI = 3.1415926;
    //定义矩形
    Rect rect1 = Rect.fromCircle(center: Offset(100.0, 0.0), radius: 100.0);
    //画1/2PI弧度的圆弧
    canvas.drawArc(rect1, 0.0, PI / 2, true, _paint);
    //画PI弧度的圆弧
    Rect rect2 = Rect.fromCircle(center: Offset(200.0, 150.0), radius: 100.0);
    canvas.drawArc(rect2, 0.0, PI, true, _paint);
  }

  //是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
