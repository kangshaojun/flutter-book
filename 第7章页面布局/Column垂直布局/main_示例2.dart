import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: '垂直布局示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局示例二'),
      ),
      //文本按重起方向排列
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,//水平方向靠左对齐
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Text('Flutter是谷歌的移动UI框架'),
          new Text('可以快速在iOS和Android上构建高质量的原生用户界面'),
          new Text('Flutter可以与现有的代码一起工作。在全世界'),
          new Text('Flutter正在被越来越多的开发者和组织使用'),
          new Text('并且Flutter是完全免费、开源的。'),
          new Text('Flutter!', style: TextStyle(fontSize: 36.0,)),//放大字号
        ],
      ),
    );

  }
}
