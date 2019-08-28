import 'package:flutter/material.dart';
import './routers/routes.dart';
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './pages/first_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //创建路由对象
    final router = Router();
    //配置路由集Routes的路由对象
    Routes.configureRoutes(router);
    //指定Application的路由对象
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: "Fluro路由导航示例",
        debugShowCheckedModeBanner: false,
        //生成路由的回调函数，当导航的命名路由的时候，会使用这个来生成界面
        onGenerateRoute: Application.router.generator,
        //主页指定为第一个页面
        home: FirstPage(),
      ),
    );
  }


}





