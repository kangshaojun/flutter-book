import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Padding填充布局示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding填充布局示例'),
      ),
      body: Center(
        //添加容器 外框
        child: Container(
          width: 300.0,
          height: 300.0,
          //容器内边距上下左右设置为60.0
          padding: EdgeInsets.all(6.0),
          //添加边框
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.green,
              width: 8.0,
            ),
          ),
          //添加容器 内框
          child: Container(
            width: 200.0,
            height: 200.0,
            //添加边框
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 8.0,
              ),
            ),
            //添加图标
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}