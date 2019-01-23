import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        title: 'Center居中布局示例',
        home: new LayoutDemo(),
      ),
    );

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Center居中布局示例'),
      ),
      body: new Center(
        child: new Text(
          'Hello Flutter',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
