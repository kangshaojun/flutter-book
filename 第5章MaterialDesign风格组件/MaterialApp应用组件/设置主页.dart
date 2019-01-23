import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
      title: 'MaterialApp示例',
    );
  }
}

//这是一个可改变的Widget
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('MaterialApp示例'),
      ),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}