import 'package:flutter/material.dart';
//切换底部导航栏
class CurrentIndexProvider with ChangeNotifier{
  //当前页面索引
  int currentIndex = 0;
  //切换页面索引
  void changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}