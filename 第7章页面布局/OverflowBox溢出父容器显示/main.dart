import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('OverflowBox溢出父容器显示示例'),
        ),
        body: Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(5.0),
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: 300.0,
            maxHeight: 500.0,
            child: Container(
              color: Colors.blueGrey,
              width: 400.0,
              height: 400.0,
            ),
          ),
        ));
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'OverflowBox溢出父容器显示示例',
      home: new LayoutDemo(),
    ),
  );
}
