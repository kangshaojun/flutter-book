import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = "网格列表示例";

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        //使用GridView.count构建网格
        body: GridView.count(
          primary: false,
          //四周增加一定的空隙
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 30.0,
          //一行上放三列数据
          crossAxisCount: 3,
          //数据项 五行三列
          children: <Widget>[
            const Text('第一行第一列'),
            const Text('第一行第二列'),
            const Text('第一行第三列'),
            const Text('第二行第一列'),
            const Text('第二行第二列'),
            const Text('第二行第三列'),
            const Text('第三行第一列'),
            const Text('第三行第二列'),
            const Text('第三行第三列'),
            const Text('第四行第一列'),
            const Text('第四行第二列'),
            const Text('第四行第三列'),
            const Text('第五行第一列'),
            const Text('第五行第二列'),
            const Text('第五行第三列'),
          ],
        ),
      ),
    );
  }
}