import 'package:flutter/material.dart';
import '../model/product.dart';
//产品数据处理
class ProductProvider with ChangeNotifier{
  //产品列表数据
  List<ProductModel> productList = [];
  //获取产品列表数据
  getProductList(List<ProductModel> list){
    productList = list;
    notifyListeners();
  }
  //上拉加载列表 追加列表数据
  addProductList(List<ProductModel> list){
    productList.addAll(list);
    notifyListeners();
  }
}