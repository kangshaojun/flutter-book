import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Wrap按宽高自动换行布局示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap按宽高自动换行布局示例'),
      ),
      //自动换行布局组件
      body: Wrap(
        spacing: 8.0, // Chip之间的间距大小
        runSpacing: 4.0, // 行之间的间距大小
        children: <Widget>[
          Chip(
            //添加圆形头像
            avatar: CircleAvatar(
                backgroundColor: Colors.lightGreen.shade800, child: Text('西门', style: TextStyle(fontSize: 10.0),)),
            label: Text('西门吹雪'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.lightBlue.shade700, child: Text('司空', style: TextStyle(fontSize: 10.0),)),
            label: Text('司空摘星'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.orange.shade800, child: Text('婉清', style: TextStyle(fontSize: 10.0),)),
            label: Text('木婉清'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue.shade900, child: Text('一郎', style: TextStyle(fontSize: 10.0),)),
            label: Text('萧十一郎'),
          ),
        ],
      ),
    );
  }
}