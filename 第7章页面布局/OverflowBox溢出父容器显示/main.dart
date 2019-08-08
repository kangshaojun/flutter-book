import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OverflowBox溢出父容器显示示例'),
        ),
        body: Container(
          color: Colors.green,
          width: 200.0,
          height: 200.0,
          padding: const EdgeInsets.all(50.0),
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxWidth: 400.0,
            maxHeight: 400.0,
            child: Container(
              color: Colors.blueGrey,
              width: 300.0,
              height: 300.0,
            ),
          ),
        ));
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'OverflowBox溢出父容器显示示例',
      home: LayoutDemo(),
    ),
  );
}