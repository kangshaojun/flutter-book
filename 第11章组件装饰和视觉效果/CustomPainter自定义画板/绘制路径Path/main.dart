import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制路径示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制路径示例',
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
    ..strokeWidth = 2.0 //画笔粗细
    ..style = PaintingStyle.stroke; //用于绘制点时PaintingStyle值无效

  //重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    //新建一个path移动到一个位置，然后画各种线
    Path path = Path()..moveTo(100.0, 100.0);
    path.lineTo(200.0, 300.0);
    path.lineTo(100.0, 200.0);
    path.lineTo(150.0, 250.0);
    path.lineTo(150.0, 500.0);
    canvas.drawPath(path, _paint);
  }

  //是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
