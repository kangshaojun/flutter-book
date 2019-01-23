import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: '图标组件示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标组件示例'),
      ),
      body: new Icon(Icons.phone,color: Colors.green[500],size: 80.0,),
    );

  }
}
