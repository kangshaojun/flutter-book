import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制圆角矩形示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制圆角矩形示例',
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
                    '绘制圆角矩形',
                    style: const TextStyle(
                      fontSize: 18.0,
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
    ..style = PaintingStyle.stroke;//画笔样式有填充PaintingStyle.fill及没有填充PaintingStyle.stroke两种

  ///重写绘制内容方法
  @override
  void paint(Canvas canvas, Size size) {

    //中心点坐标为200,200 边长为100
    Rect rect = Rect.fromCircle(center: Offset(200.0, 200.0), radius: 100.0);
    //根据矩形创建一个角度为10的圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
    //开始绘制圆角矩形
    canvas.drawRRect(rrect, _paint);
  }

  ///是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}