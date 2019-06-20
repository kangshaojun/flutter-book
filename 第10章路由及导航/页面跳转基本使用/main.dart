import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '导航页面示例',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航页面示例'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('查看商品详情页面'),
          onPressed: (){
            //压栈处理
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("导航页面示例"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            //出栈处理
            Navigator.pop(context);
          },
          child: Text('返回页面'),
        ),
      ),
    );
  }
}
