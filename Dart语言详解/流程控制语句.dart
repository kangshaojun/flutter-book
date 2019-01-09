import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  void test(){

    //if else 示例
//    String today = 'Monday';
//    if (today == 'Monday') {
//      print('今天是星期一');
//    } else if (today == 'Tuesday') {
//      print('今天是星期二');
//    } else {
//      print('今天是个好日子');
//    }


    //for循环示例
    var message = new StringBuffer("Hello Dart");
    for (var i = 0; i < 5; i++) {
      message.write('!');
    }
    print(message);

    //forEach示例
//    var arr = [0, 1, 2, 3, 4, 5, 6];
//    for (var v in arr) {
//      print(v);
//    }

    //while循环示例
//    var _temp = 0;
//    while(_temp < 5){
//
//      print("这是一个循环: " + (_temp).toString());
//      _temp ++;
//    }

    //do-while循环示例
//    var _temp = 0;
//
//    do{
//      print("这是一个循环: " + (_temp).toString());
//      _temp ++;
//    }
//    while(_temp < 5);

    //break continue示例
    var arr = [0, 1, 2, 3, 4, 5, 6];
    for (var v in arr) {
      if(v == 2 ){
        //break;
        continue;
      }
      print(v);
    }


    //switch case示例
    String today = 'Monday';
    switch (today) {
      case 'Monday':
        print('星期一');
        break;
      case 'Tuesday':
        print('星期二');
        break;
    }

    //异常处理示例
    try {
      // ···
    } on Exception catch (e) {
      print('Exception details:\n $e');
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    } finally {
      print('Do some thing:\n');
    }







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