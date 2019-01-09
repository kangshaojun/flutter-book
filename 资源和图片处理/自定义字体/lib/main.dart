import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '自定义字体',
    home: new MyApp(),
  ));
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('自定义字体'),
      ),
      body: new Center(
        child: new Text(
          '你好 flutter',
          style: new TextStyle(fontFamily: 'myfont',fontSize: 36.0),
        ),
      ),
    );
  }
}
