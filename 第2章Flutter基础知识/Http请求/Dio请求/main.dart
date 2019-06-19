import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //Dio请求方法封装
  Future request(url, {formData}) async {
    try {
      Response response;
      Dio dio = new Dio();
      dio.options.contentType =
          ContentType.parse('application/x-www-form-urlencoded');

      //发起POST请求
      response = await dio.post(url, data: formData);
      //成功返回
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('后端接口异常,请检查测试代码和服务器运行情况...');
      }
    } catch (e) {
      return print('error:::${e}');
    }
  }

  //获取商品数据
  void getGoods() async {
    //请求url
    var url = 'http://127.0.0.1:3000/getDioData';
    //请求参数商品id
    var formData = {'goodId': '001'};

    //调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      //返回数据进行Json解码
      var responseData = json.decode(value.toString());
      //打印数据
      print('商品数据:::' + responseData.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dio请求'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("发起Dio请求"),
            //获取商品数据
            onPressed: getGoods,
          ),
        ),
      ),
    );
  }
}
