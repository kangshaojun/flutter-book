import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void process(){

    
//    var week = {
//      'Monday' : '星期一',
//      'Tuesday': '星期二',
//      'Wednesday' : '星期三',
//      'Thursday': '星期四',
//      'Friday': '星期五',
//      'Saturday': '星期六',
//      'Sunday': '星期日',
//    };


    var week = new Map();
    week['Monday'] = '星期一';
    week['Tuesday'] = '星期二';
    week['Wednesday'] = '星期三';
    week['Thursday'] = '星期四';
    week['Friday'] = '星期五';
    week['Saturday'] = '星期六';
    week['Sunday'] = '星期日';
    week['0'] = '星期一';

    //assert(week['Monday'] == null);

    print(week.length);

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
            onPressed: process,
            child: Icon(Icons.add),

      ),
    )
    );}
}