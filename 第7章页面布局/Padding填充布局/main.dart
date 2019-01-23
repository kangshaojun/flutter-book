import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        title: 'Padding填充布局示例',
        home: new LayoutDemo(),
      ),
    );

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Padding填充布局示例'),
      ),
      body: new Center(

    child: new Container(
    width: 300.0,
      height: 300.0,
      padding: EdgeInsets.all(6.0),//容器填充上下左右设置为60.0
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(
          color: Colors.green,
          width: 8.0,
        ),
      ),
      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(
            color: Colors.blue,
            width: 8.0,
          ),
        ),
        child: new FlutterLogo(),
      ),
    ),
    ),
    );
  }
}



