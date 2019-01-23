import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Opacity不透明度示例'),
      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.3, //不透明度设置为0.3
          child: new Container(
            width: 250.0,
            height: 100.0,
            decoration: new BoxDecoration(
              color: Colors.black, //背景色设置为纯黑
            ),
            child: Text(
              '不透明度为0.3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              ),
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
      title: 'Opacity不透明度示例',
      home: new LayoutDemo(),
    ),
  );
}
