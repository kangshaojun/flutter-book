import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;//当前选中项的索引
  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar示例'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),//居中显示某一个文本
      ),
      //底部导航按钮 包含图标及文本
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('发现')),
        ],
        currentIndex: _selectedIndex,//当前选中项的索引
        fixedColor: Colors.deepPurple,//选项中项的颜色
        onTap: _onItemTapped,//选择按下处理
      ),
    );
  }

  //选择按下处理 设置当前索引为index值
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
