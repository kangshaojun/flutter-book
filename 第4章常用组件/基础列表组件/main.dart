import 'package:flutter/material.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final title = "基础列表示例";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        //添加基础列表
        body: new ListView(
          //添加静态数据
          children: <Widget>[
            ListTile(
              //添加图标
              leading: Icon(Icons.alarm),
              //添加文本
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text('Airplay'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
          ],
        ),
      ),

    );
  }
}