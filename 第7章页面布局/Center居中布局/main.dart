import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Center居中布局示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center居中布局示例'),
      ),
      //居中组件 位于body的中心位置
      body: Center(
        //添加文本
        child: Text(
          'Hello Flutter',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
