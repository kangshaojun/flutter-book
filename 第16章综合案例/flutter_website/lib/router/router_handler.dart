import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_website/page/index_page.dart';
import '../page/product_detail_page.dart';

//根路由Handler返回IndexPage页面
Handler rootHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return IndexPage();
    }
);
//产品路由Handler返回产品详情页面 传入productId参数
Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    //获取productId产数
    String productId = params['productId'].first;
    //实例化产品详情页面并返回
    return ProductDetailPage(productId);
  }
);
