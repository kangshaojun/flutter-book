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
    return new MaterialApp(
      //用来组装TabBar及TabBarView
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            //添加导航栏
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          //添加导航视图
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              return Center(child: Text(tab.text));
            }).toList(),
          ),
        ),
      ),
    );
  }
}






