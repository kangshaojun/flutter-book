import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomPaint绘制嵌套矩形示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'CustomPaint绘制嵌套矩形示例',
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

    //初始化两个矩形
    Rect rect1 = Rect.fromCircle(center: Offset(150.0, 150.0), radius: 80.0);
    Rect rect2 = Rect.fromCircle(center: Offset(150.0, 150.0), radius: 40.0);
    //再把这两个矩形转化成圆角矩形
    RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(20.0));
    RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(10.0));
    canvas.drawDRRect(outer, inner, _paint);
  }

  //是否需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}