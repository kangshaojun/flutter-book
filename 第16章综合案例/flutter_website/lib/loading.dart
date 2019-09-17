import 'package:flutter/material.dart';
import 'dart:async';
import './router/application.dart';
//启动APP加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //在加载页面停顿2秒
    Future.delayed(Duration(seconds: 2), () {
      print('Flutter企业站启动...');
      //使用路由跳转至应用主界面
      Application.router.navigateTo(context, "/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            //加载页面背景图
            Image.asset(
              'assets/images/loading.jpeg',
            ),
            //加载页面文字内容
            Positioned(
              //距离顶部100
              top: 100,
              child: Container(
                width: 400,
                child: Center(
                  child: Text(
                    'Flutter企业站',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
