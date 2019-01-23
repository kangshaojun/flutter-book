import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '导航页面示例',
    home: new FirstScreen(),
  ));
}


class FirstScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('导航页面示例'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('查看商品详情页面'),
          onPressed: (){
            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SecondScreen())
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("导航页面示例"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: new Text('返回页面'),
        ),
      ),
    );
  }
}
