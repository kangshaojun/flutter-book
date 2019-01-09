import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
  //使用generate方法产生500条数据
  items: new List<String>.generate(500, (i) => "Item $i"),
));

class MyApp extends StatelessWidget {

  //列表数据集
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = "长列表示例";

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        //使用ListView.builder来构造列表项
        body: new ListView.builder(
          //列表长度
          itemCount: items.length,
          //列表项构造器
          itemBuilder: (context,index) {
            return new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
