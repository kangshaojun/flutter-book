import 'package:flutter/material.dart';
import 'home_banner.dart';
import 'home_product_page.dart';
//首页由轮播图及最新产品组成
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          //轮播图
          BannerWidget(),
          //最新产品
          HomeProductPage(),
        ],
      ),
    );
  }
}
