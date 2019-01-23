import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: 'AppBar应用按钮示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('AppBar应用按钮示例'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: '添加',
            onPressed: (){},
          ),
        ],
      ),

    );

  }
}
