import 'package:flutter/material.dart';
import 'package:nativeweb/nativeweb.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //定义WebController对象
  WebController webController;
  //定义NativeWeb插件对象
  NativeWeb nativeWeb;

  @override
  void initState() {
    super.initState();
    //创建NativeWeb插件对象 View创建完成提供回调方法
    nativeWeb = NativeWeb(onWebCreated: onWebCreated,);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PlatformView示例'),
        ),
        body: Container(
          //渲染插件显示加载的网页内容
          child: nativeWeb,
          height: 600.0,
        ),
      ),
    );
    
  }

  //执行网页加载动作
  void onWebCreated(webController){
    this.webController = webController;
    this.webController.loadUrl("http://github.com/");
  }
}
