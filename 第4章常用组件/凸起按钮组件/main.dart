import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RaisedButton示例',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('RaisedButton组件示例'),
        ),
        body: new Center(
          child: new RaisedButton(
            onPressed: () {
              //按下事件处理
            },
            child: new Text('RaisedButton组件'),
          ),
        ),
      ),
    );
  }
}
