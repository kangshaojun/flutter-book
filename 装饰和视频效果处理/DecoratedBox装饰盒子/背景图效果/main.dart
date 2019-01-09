import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BoxDecoration装饰盒子-背景图示例'),
      ),
      body: new Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: ExactAssetImage('images/1.jpeg'),//添加image属性
              fit: BoxFit.cover,//填充类型
            ),
          ),
        )
      ),
    );
  }
}
void main() {
  runApp(
    new MaterialApp(
      title: 'BoxDecoration装饰盒子-背景图示例',
      home: new LayoutDemo(),
    ),
  );
}
