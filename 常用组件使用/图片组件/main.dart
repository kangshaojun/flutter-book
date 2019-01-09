import 'package:flutter/material.dart';

void main() {
  runApp(
      new MaterialApp(
        title: 'Image demo',
        home: new ImageDemo(),
      )
  );
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      //添加网络图片
      child: new Image.network(
        //图片url
        'https://flutter.io/images/flutter-mark-square-100.png',
        //填充模式
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
