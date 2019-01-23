import 'package:flutter/material.dart';
import './app.dart';
import './loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './search.dart';

//应用程序入口
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      //自定义主题
      theme: mDefaultTheme,
      //添加路由表
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new App(),
        "/friends": (_) => new WebviewScaffold(
              //Webview插件
              url: "https://flutter.io/",
              appBar: new AppBar(
                title: new Text("Flutter官网"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
        'search': (BuildContext context) => new Search(), //搜索页面路由
      },
      //指定首页 默认为加载页面
      home: new LoadingPage(),
    ));

//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);
