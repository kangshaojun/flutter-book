import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: '水平布局示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('垂直布局示例一'),
      ),
      body: new Column(
        children: <Widget>[
          new Text('Flutter'),
          new Text('垂直布局'),
          new Expanded(
            child: new FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );

  }
}
