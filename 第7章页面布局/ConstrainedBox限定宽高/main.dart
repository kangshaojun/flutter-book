import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox限定宽高示例'),
      ),
      //添加容器
      body: ConstrainedBox(
        //设置限定值
        constraints: const BoxConstraints(
          minWidth: 150.0,
          minHeight: 150.0,
          maxWidth: 220.0,
          maxHeight: 220.0,
        ),
        //子容器
        child: Container(
          width: 300.0,
          height: 300.0,
          color: Colors.green,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'ConstrainedBox限定宽高示例',
      home: LayoutDemo(),
    ),
  );
}
