import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: '图标按钮组件示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('图标按钮组件示例'),
      ),
      body: new Center(
        child: new IconButton(
          icon: Icon(Icons.volume_up,size: 48.0,),
          tooltip: '按下操作',
          onPressed: () {
            print('按下操作');
          },
        ),
      ),
    );

  }
}
