import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AspectRatio调整宽高比示例'),
      ),
      body: new Container(
        height: 200.0,
        child: new AspectRatio(
          aspectRatio: 1.5,//比例可以调整
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
      title: 'AspectRatio调整宽高比',
      home: new LayoutDemo(),
    ),
  );
}
