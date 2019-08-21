import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//缓动动画
class EasingAnimation extends StatefulWidget {
  @override
  _EasingAnimationState createState() => _EasingAnimationState();
}

class _EasingAnimationState extends State<EasingAnimation> with TickerProviderStateMixin {
  //动画控制器
  AnimationController _controller;
  //补间动画
  Animation _animation;

  @override
  void initState() {
    super.initState();
    //创建动画控制器 时长设置为2秒
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2),);
    //创建补间对象 值从-1.0到0.0进行估值
    _animation = Tween(begin: -1.0, end: 0.0).animate(
      //非线性动画
      CurvedAnimation(
        parent: _controller,
        //缓动动画 决定了运行的轨迹 快出慢进
        curve: Curves.fastOutSlowIn,
      ),
    )..addStatusListener(_handler);
  }

  //动画运行状态回调
  _handler(status) {
    //动画执行完成
    if (status == AnimationStatus.completed) {
      //移除状态监听
      _animation.removeStatusListener(_handler);
      //动画重置
      _controller.reset();
      //再次创建补间对象 值从0.0到1.0进行估值
      _animation = Tween(begin: 0.0, end: 1.0).animate(
        //缓动动画 决定了运行的轨迹
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
      )..addStatusListener(
          (status) {
            //监听动画状态状态
            if (status == AnimationStatus.completed) {
              Navigator.pop(context);
            }
          },
        );
      //执行动画
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    //计算当前页面宽度
    final double width = MediaQuery.of(context).size.width;
    //执行动画
    _controller.forward();
    return Scaffold(
      appBar: AppBar(
        title: Text('缓动动画'),
      ),
      //动画构建器
      body: AnimatedBuilder(
        //动画控制器
        animation: _controller,
        //构建动画
        builder: (context, child) {
          //采用矩阵转换
          return Transform(
            //X方向值 = 当前动画值 * 宽度
            transform: Matrix4.translationValues(
              _animation.value * width,
              //Y = 0
              0.0,
              //Z = 0
              0.0,
            ),
            //移动的色块
            child: Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  //销毁动画
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
