import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //获取天气数据
  void getWeatherData() async {
    try {
      //实例化一个HttpClient对象
      HttpClient httpClient = new HttpClient();

      //发起请求
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://t.weather.sojson.com/api/weather/city/101030100"));

      //等待服务器返回数据
      HttpClientResponse response = await request.close();

      //使用utf8.decoder从response里解析数据
      var result = await response.transform(utf8.decoder).join();
      //输出响应头
      print(result);

      //httpClient关闭
      httpClient.close();

    } catch (e) {
      print("请求失败：$e");
    } finally {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'httpclient请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('httpclient请求'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("获取天气数据"),
            onPressed: getWeatherData,
          ),
        ),
      ),
    );
  }
}
