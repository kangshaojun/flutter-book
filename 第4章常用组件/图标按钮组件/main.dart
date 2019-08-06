import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: '图标按钮组件示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图标按钮组件示例'),
      ),
      body: Center(
        //添加图标按钮
        child: IconButton(
          //图标元素
          icon: Icon(Icons.volume_up,size: 48.0,),
          //按钮提示
          tooltip: '按下操作',
          //按下事件响应
          onPressed:(){
            print('按下操作');
          },
        ),
      ),
    );
  }
}
