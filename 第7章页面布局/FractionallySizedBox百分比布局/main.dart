import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('FractionallySizedBox百分比布局示例'),
      ),
      body: new Container(
        color: Colors.blueGrey,
        height: 200.0,
        width: 200.0,
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,//元素左上角对齐
          widthFactor: 0.5,//宽度因子
          heightFactor: 1.5,//高度因子
          child: new Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
void main() {
  runApp(
    new MaterialApp(
      title: 'FractionallySizedBox百分比布局示例',
      home: new LayoutDemo(),
    ),
  );
}
