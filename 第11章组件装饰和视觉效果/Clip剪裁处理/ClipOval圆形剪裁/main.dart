import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval圆形剪裁示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipOval圆形剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          //圆形剪裁
          child: ClipOval(
            //固定大小
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              //添加图片
              child: Image.asset(
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
