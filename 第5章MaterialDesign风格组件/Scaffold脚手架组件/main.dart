import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Scaffold脚手架组件示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //头部元素 比如：左侧返回按钮 中间标题 右侧菜单
      appBar: AppBar(
        title: Text('Scaffold脚手架组件示例'),
      ),
      //视图内容部分 通常作为应用页面的主显示区域
      body: Center(
        child: Text('Scaffold'),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),
      //添加FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //FAB按钮居中展示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
