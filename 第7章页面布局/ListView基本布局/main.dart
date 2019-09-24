import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ListView布局示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //列表项集合
    List<Widget> list = <Widget>[
      //列表项
      ListTile(
        //标题
        title: Text('广州市黄埔大道建中路店',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        //子标题
        subtitle: Text('广州市黄埔大道建中路3号'),
        //左侧图标
        leading: Icon(
          Icons.fastfood,
          color: Colors.orange,
        ),
      ),
      ListTile(
        title: Text('广州市白云区机场路白云机场店',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('广州市白云区机场路T3航站楼'),
        leading: Icon(
          Icons.airplay,
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('广州市中山大道中山大学附属医院',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('广州市中山大道45号'),
        leading: Icon(
          Icons.local_hospital,
          color: Colors.green,
        ),
      ),
      ListTile(
        title: Text('广州市天河区太平洋数码城',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0),),
        subtitle: Text('广州市天河区岗顶太平洋数码城'),
        leading: Icon(
          Icons.computer,
          color: Colors.deepPurple,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('ListView布局示例'),
      ),
      body: Center(
        //列表视图组件
        child: ListView(
          children: list,
        ),
      ),
    );
  }
}