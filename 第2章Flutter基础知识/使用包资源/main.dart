import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '使用第三方包示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用第三方包示例'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              //指定url并发起请求
              const url = 'https://www.baidu.com';
              //调用url_launcher包里的launch方法
              launch(url);
            },
            child: Text('打开百度'),
          ),
        ),
      ),
    );
  }
}
