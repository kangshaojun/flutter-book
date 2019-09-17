import 'package:flutter/material.dart';
import '../model/product_detail_model.dart';
//产品详情数据处理
class ProductDetailProvider with ChangeNotifier{
  //产品详情
  ProductDetail productDetail;
  //获取产品详情
  void getProductDetail(ProductDetail detail){
    productDetail = detail;
    notifyListeners();
  }
}