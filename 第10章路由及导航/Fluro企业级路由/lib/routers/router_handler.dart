import 'package:fluro/fluro.dart';
import '../pages/second_page.dart';
import 'package:flutter/material.dart';

//创建Handler用来接收路由参数及返回第二个页面对象
Handler secondPageHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    //读取goodId参数 first即为第一个数据
    String goodId = params['goodId'].first;
    return SecondPage(goodId);
  }
);
