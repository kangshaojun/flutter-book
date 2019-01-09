import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ClipOval圆形剪裁示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipOval圆形剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: new ClipOval(
            child: new SizedBox(
              width: 300.0,
              height: 300.0,
              child: new Image.asset(
                "images/8.jpeg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
