import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ConstrainedBox限定宽高示例'),
      ),
      body: new ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 150.0,
          minHeight: 150.0,
          maxWidth: 220.0,
          maxHeight: 220.0,
        ),
        child: new Container(
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
    new MaterialApp(
      title: 'ConstrainedBox限定宽高示例',
      home: new LayoutDemo(),
    ),
  );
}
