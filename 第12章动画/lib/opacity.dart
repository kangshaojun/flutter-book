import 'package:flutter/material.dart';

//淡入淡出动画
class OpacityAnimation extends StatefulWidget {
  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  //控制动画显示状态变量
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('淡入淡出动画'),
      ),
      body: Center(
        //添加Opacity动画
        child: AnimatedOpacity(
          //控制opacity值 范围从0.0到1.0
          opacity: _visible ? 1.0 : 0.0,
          //设置动画时长
          duration: Duration(
              milliseconds: 1000
          ),
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.deepPurple,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //控制动画显示状态
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "显示隐藏",
        child: Icon(Icons.flip),
      ),
    );
  }
}

