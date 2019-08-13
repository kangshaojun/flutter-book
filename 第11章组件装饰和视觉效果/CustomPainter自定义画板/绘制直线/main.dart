import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制直线示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制直线示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: SizedBox(
              width: 500.0,
              height: 500.0,
              child: CustomPaint(
                painter: LinePainter(),
                child: Center(
                  child: Text(
                    '绘制直线',
                    style: const TextStyle(
                      fontSize: 38.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}

//继承于CustomPainter并且实现CustomPainter里面的paint和shouldRepaint方法
class LinePainter extends CustomPainter {

  //定义画笔
  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke;

  //重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
    canvas.drawLine(Offset(20.0, 20.0), Offset(300.0, 20.0), _paint);
  }

  //重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}