import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxDecoration装饰盒子-边框圆角示例'),
      ),
      body: Center(
        child: Container(
          width: 260.0,
          height: 260.0,
          //装饰器
          decoration: BoxDecoration(
            //背景色
            color: Colors.white,
            //添加所有的边框,颜色为灰色，宽度为4.0
            border: Border.all(color: Colors.grey, width: 4.0),
            //添加边框弧度，这样会有一个圆角效果
            borderRadius: BorderRadius.circular(36.0),
            //添加背景图片
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
    MaterialApp(
      title: 'BoxDecoration装饰盒子-边框圆角示例',
      home: LayoutDemo(),
    ),
  );
}
