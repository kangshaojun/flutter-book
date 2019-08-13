import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipRect矩形剪裁示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ClipRect矩形剪裁示例',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: ClipRect(
            //指定自定义Clipper
            clipper: RectClipper(),
            child: SizedBox(
              width: 300.0,
              height:300.0,
              child: Image.asset("images/8.jpeg",fit: BoxFit.fill,),
            ) ,
          ),
        ),
      ),
    );
  }
}

//自定义Clipper,类型为Rect
class RectClipper extends CustomClipper<Rect>{

  //重写获取剪裁范围
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(100.0, 100.0, size.width - 100.0,  size.height- 100.0);
  }

  //重写是否重新剪裁
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

}
