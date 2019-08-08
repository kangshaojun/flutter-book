import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CupertinoButton组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('CupertinoButton组件示例'),
        ),
        body: Center(
          //Cupertino风格按钮
          child: CupertinoButton(
            child: Text(//按钮label
              'CupertinoButton',
            ),
            color: Colors.blue,//按钮颜色
            onPressed: (){},//按下事件回调
          ),
        ),
      ),
    );
  }
}
