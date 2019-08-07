import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'AppBar应用按钮示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //应用按钮
      appBar: AppBar(
        //左侧图标
        leading: Icon(Icons.home),
        //标题
        title: Text('AppBar应用按钮示例'),
        //操作按钮集
        actions: <Widget>[
          //图标按钮
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
