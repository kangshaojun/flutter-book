import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SimpleDialog组件示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SimpleDialog组件示例'),
        ),
        body: Center(
          child: SimpleDialog(
            title: const Text('对话框标题'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {  },
                child: const Text('第一行信息'),
              ),
              SimpleDialogOption(
                onPressed: () {  },
                child: const Text('第二行信息'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
