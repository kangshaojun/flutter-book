import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opacity不透明度示例'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.3, //不透明度设置为0.3
          child: Container(
            width: 250.0,
            height: 100.0,
            //添加装饰器
            decoration: BoxDecoration(
              color: Colors.black, //背景色设置为纯黑
            ),
            child: Text(
              '不透明度为0.3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Opacity不透明度示例',
      home: LayoutDemo(),
    ),
  );
}
