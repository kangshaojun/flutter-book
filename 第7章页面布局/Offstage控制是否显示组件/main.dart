import 'package:flutter/material.dart';



void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = "Offstage控制是否显示组件示例";
    return new MaterialApp(
      title: appTitle,
      home: new MyHomePage(title:appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key,this.title}):super(key:key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  //状态控制是否显示文本组件
  bool offstage = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: new Offstage(
          offstage: offstage,//控制是否显示
          child: new Text(
            '我出来啦！',
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){

          //设置是否显示文本组件
          setState(() {
            offstage = !offstage;
          });

        },
        tooltip: "显示隐藏",
        child: new Icon(Icons.flip),
      ),

    );
  }

}
