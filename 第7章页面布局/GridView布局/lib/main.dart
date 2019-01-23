import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'GridView九宫格示例',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用generate构造图片列表
    List<Container> _buildGridTitleList(int count) {
      return new List<Container>.generate(
          count,
              (int index) => new Container(
            child: new Image.asset('images/${index + 1}.jpeg'),
          ));
    }

    //渲染GridView
    Widget buildGrid(){
      return new GridView.extent(
        maxCrossAxisExtent: 150.0,//次轴的宽度
        padding: const EdgeInsets.all(4.0),//上下左右内边距
        mainAxisSpacing: 4.0,//主轴间隙
        crossAxisSpacing: 4.0,//次轴间隙
        children: _buildGridTitleList(9),//添加9个元素
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('GridView九宫格示例'),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }
}
