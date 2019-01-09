import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SizedBox设置具体尺寸示例'),
      ),
      body: SizedBox(
        //固定宽为200.0 高为300.0
        width: 200.0,
        height: 300.0,
        child: const Card(
            child: Text('SizedBox',
              style: TextStyle(
                fontSize: 36.0,
              ),
            )),
      ),
    );
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
