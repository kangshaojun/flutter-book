import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void process(){

    


  }

  //判断两个字符串是否相等
  bool equal(String str1, String str2) {
    return str1 == str2;
  }


  //获取用户信息
//  String getUserInfo(String name, String sex, [String from]) {
//    var info = '$name的性别是$sex';
//    if (from != null) {
//      info = '$info来自$from';
//    }
//    return info;
//  }

//  void test(){
//    print(getUserInfo('小王', '男'));
//  }



  //获取用户信息 使用等号(`= `)来设置默位置字参数
  String getUserInfo(String name, String sex, [String from = '中国']) {
    var info = '$name的性别是$sex';
    if (from != null) {
      info = '$info来自$from';
    }
    return info;
  }


  void test(){
    print(getUserInfo('小王', '男'));
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: test,
            child: Icon(Icons.add),

      ),
    )
    );}
}