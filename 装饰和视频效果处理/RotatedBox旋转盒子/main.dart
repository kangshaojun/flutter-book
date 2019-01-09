import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RotatedBox旋转盒子示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'RotatedBox旋转盒子示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: RotatedBox(
            quarterTurns: 3,//旋转次数，一次为90度
            child: Text(
              'RotatedBox旋转盒子',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
        ),
      ),
    );
  }
}
