import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//数字变化动画
class ValueAnimation extends StatefulWidget {
  @override
  _ValueAnimationState createState() => _ValueAnimationState();
}

class _ValueAnimationState extends State<ValueAnimation> with TickerProviderStateMixin {
  //动画控制器
  AnimationController controller;
  //补间对象
  Animation animation;

  @override
  void initState() {
    super.initState();
    //创建动画控制器 时长设置为1秒
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    //创建非线性动画 让数字在切换时有一种动感
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    //创建整型补间对象 产生从0到10的数字
    animation = IntTween(begin: 0, end: 10).animate(curve)..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //当动画执行完成后 执行反转动画 如0...10 然后是10...0
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              appBar: AppBar(
                title: Text('数字变化动画'),
              ),
              body: Center(
                //根据补间对象产生的数字显示
                child: Text(animation.value.toString(), style: TextStyle(fontSize: 48.0)),
              ));
        });
  }
  //销毁动画
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
