import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: '水平布局示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('垂直布局示例一'),
      ),
      //垂直布局
      body: Column(
        children: <Widget>[
          Text('Flutter'),
          Text('垂直布局'),
          //添加图标
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );

  }
}
