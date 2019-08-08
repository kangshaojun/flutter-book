import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'IndexedStack布局示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var stack = IndexedStack(
      index: 1,//设置索引为1就只显示文本内容了
      alignment: const FractionalOffset(0.2, 0.2),
      children: <Widget>[
        //索引为0
        CircleAvatar(
          backgroundImage: new AssetImage('images/1.jpeg'),
          radius: 100.0,
        ),
        //索引为1
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
          ),
          child: Text(
            '我是超级飞侠',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack层叠布局示例'),
      ),
      body: Center(
        child: stack,
      ),
    );
  }
}