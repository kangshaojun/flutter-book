import 'package:flutter/material.dart';

//字体放大动画
class FontAnimation extends StatefulWidget {
  _FontAnimation createState() => _FontAnimation();
}

//TickerProvider提供动画驱动
class _FontAnimation extends State<FontAnimation> with SingleTickerProviderStateMixin {
  //补间动画
  Animation<double> tween;
  //动画控制对象
  AnimationController controller;
  /*初始化状态*/
  initState() {
    super.initState();
    /**
     * 创建动画控制类对象
     * duration:动画执行的时间 单位是毫秒
     * vsync:防止动画离屏之后继续消耗资源
     */
    controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    /*创建补间对象*/
    tween = Tween(begin: 0.0, end: 1.0)
        .animate(controller)//返回Animation对象
      ..addListener((){//添加监听
        setState((){
          print(tween.value);//打印补间插值
        });
      });
    controller.forward();//执行动画
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter动画',
        ),
      ),
      //添加手势组件
      body: GestureDetector(
          onTap:(){
            //点击文本重新执行动画
            startAnimtaion();
          },
          child: Center(
              child: Text(
                "字体放大",
                //根据动画执行过程中产生的value 更改文本字体大小
                style: TextStyle(fontSize: 60 * controller.value),
              )
          )
      ),
    );
  }
  //重新开始执行动画
  startAnimtaion() {
    setState(() {
      //从起始值执行动画
      controller.forward(from: 0.0);
    });
  }
  //销毁动画
  dispose() {
    //销毁控制器对象
    controller.dispose();
    super.dispose();
  }
}
