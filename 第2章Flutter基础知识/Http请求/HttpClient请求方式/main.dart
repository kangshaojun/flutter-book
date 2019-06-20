import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //获取数据 此方法需要异步执行async/await
  void getHttpClientData() async {
    try {
      //实例化一个HttpClient对象
      HttpClient httpClient = HttpClient();

      //发起请求 (IP + PORT + 请求接口)
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse("http://127.0.0.1:3000/getHttpClientData"));

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
      title: 'HttpClient请求',
      home: Scaffold(
        appBar: AppBar(
          title: Text('HttpClient请求'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("发起HttpClient请求"),
            onPressed: getHttpClientData,
          ),
        ),
      ),
    );
  }
}
