import 'package:flutter/material.dart';



void main() {
  runApp(new MaterialApp(
    title: '页面切换动画',
    home: new FirstPage(),
  ));
}



class FirstPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("页面切换动画图一"),
      ),
      body: new GestureDetector(
        child: new Hero(
          tag: '第一张图片',
          child: new Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541753399410&di=05760e1c65686b018cf28d440a6ddf5c&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2FD%2FD7%2FD7D7640C07A00D831EFD2AC270ED7FA7.jpg",
          ),
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (_){
            return new SecondPage();
          }));
        },
      ),
    );
  }
}


class SecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("页面切换动画图二"),
      ),
      body: new GestureDetector(

        child: new Hero(
          tag: "第二张图片",
          child: new Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541753302014&di=9edfe992f8b9d395134fd977dbfeab28&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F2f738bd4b31c870143a3a1dc2c7f9e2f0708fff7.jpg"),
        ),


        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}