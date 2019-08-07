import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar示例'),
        ),
        body: Center(
          child: Text(
            'SnackBar示例',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        //FAB按钮
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              //点击回调事件 弹出一句提示语句
              Scaffold.of(context).showSnackBar(SnackBar(
                //提示信息内容部分
                content: Text("显示SnackBar"),
              ));
            },
            shape: CircleBorder(),
          );
        }),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.endFloat, //居中放置 位置可以设置成左中右
      ),
    );
  }
}
