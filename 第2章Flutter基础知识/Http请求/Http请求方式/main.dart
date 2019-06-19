import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http请求示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('http请求示例'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              //请求后台url路径(IP + PORT + 请求接口)
              var url = 'http://127.0.0.1:3000/getHttpData';
              //向后台发起get请求 response为返回对象
              http.get(url).then((response) {
                print("状态： ${response.statusCode}");
                print("正文： ${response.body}");
              });
            },
            child: Text('发起http请求'),
          ),
        ),
      ),
    );
  }
}
