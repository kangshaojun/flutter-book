import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        title: 'Image demo',
        home: ImageDemo(),
      )
  );
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //居中展示
    return Center(
      //添加网络图片
      child: Image.network(
        //图片url
        'https://flutter.io/images/flutter-mark-square-100.png',
        //填充模式
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
