import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '页面跳转返回数据示例',
    home: FirstPage(),
  ));
}

//第一个页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面跳转返回数据示例"),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

//跳转按钮
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateToSecondPage(context);
      },
      child: Text('跳转到第二个页面'),
    );
  }

  //路由至第二个页面
  _navigateToSecondPage(BuildContext context) async {
    //压栈操作并等待页面返回操作
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );
    //读取并显示返回值
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }
}

//第二个页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择一条数据"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  //出栈带上参数 返回到上一个页面
                  Navigator.pop(context, 'hi google');
                },
                child: Text('hi google'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  //出栈带上参数 返回到上一个页面
                  Navigator.pop(context, 'hi flutter');
                },
                child: Text('hi flutter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
