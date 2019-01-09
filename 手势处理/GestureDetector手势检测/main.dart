import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '按下处理Demo',
    home: new MyApp(),
  ));
}

class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    //一定要把被触摸的组件放在GestureDetector里面
    return new GestureDetector(
      onTap: (){
        //底部消息揭示
        final snackBar = new SnackBar(content: new Text("你已按下"),);
        Scaffold.of(context).showSnackBar(snackBar);
      },
      //添加容器接收触摸动作
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: new Text('测试按钮'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('按下处理Demo'),
        ),
        body:new Center(child: new MyButton(),)
    );
  }
}
