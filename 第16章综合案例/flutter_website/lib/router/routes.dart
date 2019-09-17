import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';
//定义路径及跳转页面
class Routes{
  //根路径
  static String root = '/';
  //产品详情路径
  static String detailsPage = '/detail';
  //配置路由
  static void configureRoutes(Router router){
    //路径没找到Handler
    router.notFoundHandler =  Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('error::: router 没有找到');
      }
    );
    //定义产品详情路由Handler
    router.define(detailsPage, handler: detailsHandler);
    //定义根路由Handler
    router.define(root, handler: rootHandler);
  }
}
