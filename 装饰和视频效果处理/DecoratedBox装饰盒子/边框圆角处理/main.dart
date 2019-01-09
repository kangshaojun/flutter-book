import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BoxDecoration装饰盒子-边框圆角示例'),
      ),
      body: new Center(
        child: Container(
          width: 260.0,
          height: 260.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 4.0),
            //添加所有的边框,颜色为灰色，宽度为4.0
            borderRadius: BorderRadius.circular(36.0),
            //添加边框弧度，这样会有一个圆角效果
            image: DecorationImage(
              image: ExactAssetImage('images/1.jpeg'), //添加image属性
              fit: BoxFit.cover, //填充类型
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'BoxDecoration装饰盒子-边框圆角示例',
      home: new LayoutDemo(),
    ),
  );
}
