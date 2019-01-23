import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ClipRRect圆角矩形剪裁示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipRRect圆角矩形剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: new ClipRRect(
            borderRadius: new BorderRadius.all(
                new Radius.circular(30.0)),//圆角弧度，值越大弧度越大
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
