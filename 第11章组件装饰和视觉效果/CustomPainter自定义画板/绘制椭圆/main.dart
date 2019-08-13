import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制椭圆示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制椭圆示例',
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
                    '绘制椭圆',
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
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.fill;//画笔样式有填充PaintingStyle.fill及没有填充PaintingStyle.stroke两种

  ///重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {
    //绘制椭圆
    //使用一个矩形来确定绘制的范围,椭圆是在这个矩形之中内切的,第一个参数为左上角坐标,第二个参数为右下角坐标
    Rect rect = Rect.fromPoints(Offset(80.0, 200.0), Offset(300.0, 300.0));
    canvas.drawOval(rect, _paint);
  }

  ///重写是否需要重绘的
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}