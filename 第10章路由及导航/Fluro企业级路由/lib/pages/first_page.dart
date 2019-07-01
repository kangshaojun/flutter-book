import 'package:flutter/material.dart';
import '../routers/application.dart';
import 'package:fluro/fluro.dart';


//第一个页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluro路由导航示例"),
      ),
      body: Center(
        child: RaisedButton(
          //点击处理
          onPressed: () {
            _navigateToSecondPage(context);
          },
          child: Text('打开第二个页面'),
        ),
      ),
    );
  }

  //路由至第二个页面
  _navigateToSecondPage(BuildContext context) async {
    //路由带的参数
    String goodId  = '001';
    //通过Application类里的路由router导航至第二个页面 可指定页面切换动画类型
    Application.router.navigateTo(context, "/secondPage?goodId=$goodId",transition: TransitionType.fadeIn).then((result) {//回传值
      //当第二个页面返回时带的参数为result值
      if (result != null) {
        print(result);
      }
    });
  }
}

