import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//图表动画
class ChartsAnimation extends StatefulWidget {
  @override
  _ChartsAnimationState createState() => _ChartsAnimationState();
}

class _ChartsAnimationState extends State<ChartsAnimation> {
  //定义图表高度
  var height = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图表动画'),
      ),
      body: Center(
        child: Container(
          height: 400,
          alignment: AlignmentDirectional.bottomStart,
          //点击处理
          child: InkWell(
            onTap: (){
              //设置状态改变图表高度
              setState(() {
                height = 320;
              });
            },
            //水平布局 放三个容器用于展示三个柱状图
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //动画容器
                AnimatedContainer(
                  //动画时长
                  duration: Duration(seconds: 1),
                  //宽度不变
                  width: 40.0,
                  //当高度发生变化时 会有一个缓动效果
                  height: height - 40,
                  color: Colors.greenAccent,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 2),
                  width: 40.0,
                  height: height - 10,
                  color: Colors.yellow,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 3),
                  width: 40.0,
                  height: height - 60,
                  color: Colors.red,
                ),
                AnimatedContainer(
                  margin: EdgeInsets.only(left: 10.0),
                  duration: Duration(seconds: 2),
                  width: 40.0,
                  height: height - 50,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
