import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制多个点示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制多个点示例',
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
    ..strokeCap = StrokeCap.round//StrokeCap.round为圆点 StrokeCap.square为方形
    ..isAntiAlias = true
    ..strokeWidth = 20.0//画笔粗细 值调大点 这样点看起来明显一些
    ..style = PaintingStyle.fill; //用于绘制点时PaintingStyle值无效

  //重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    //绘制点
    canvas.drawPoints(

      //PointMode的枚举类型有三个，points点，lines隔点连接线，polygon相邻连接线
        PointMode.points,
        [
          Offset(50.0, 60.0),
          Offset(40.0, 90.0),
          Offset(100.0, 100.0),
          Offset(300.0, 350.0),
          Offset(400.0, 80.0),
          Offset(200.0, 200.0),
        ],
        _paint..color = Colors.grey);
  }

  //是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
