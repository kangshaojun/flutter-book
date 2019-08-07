import 'package:flutter/material.dart';

void main() {
  runApp(new DefaultTabControllerSample());
}

class DefaultTabControllerSample extends StatelessWidget {

  //选项卡数据
  final List<Tab> myTabs = <Tab>[
    Tab(text: '选项卡一'),
    Tab(text: '选项卡二'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //用来组装TabBar及TabBarView
      home: DefaultTabController(
        //选项卡长度
        length: myTabs.length,
        child: Scaffold(
          //应用按钮
          appBar: AppBar(
            //页面标题
            title: Text("AppBar标题"),
            //添加选项卡按钮 注意此bottom表示在AppBar的底部,在整个页面上来看还处于顶部区域
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          //添加选项卡视图即页面中间内容显示区域
          body: TabBarView(
            //使用map迭代显示中间内空
            children: myTabs.map((Tab tab) {
              return Center(child: Text(tab.text));
            }).toList(),
          ),
        ),
      ),
    );
  }
}