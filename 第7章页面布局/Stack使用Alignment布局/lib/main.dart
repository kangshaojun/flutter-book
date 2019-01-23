import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Stack布局示例Alignment',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    var stack = new Stack(
      //子组件左上角对齐
      alignment: Alignment.topLeft,
      children: <Widget>[
        //底部添加一个头像
        new CircleAvatar(
          backgroundImage: new AssetImage('images/1.jpeg'),
          radius: 100.0,
        ),
        //上面加一个容器 容器里再放一个文本
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black38,
          ),
          child: new Text(
            '我是超级飞侠',
            style: new TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Stack层叠布局示例'),
      ),
      body: new Center(
        child: stack,
      ),
    );
  }
}