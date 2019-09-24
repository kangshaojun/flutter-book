import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_demo/flutter_plugin_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  //获取底层的方法是异步的 所以调用的方法也要异步处理才行
  Future<void> initPlatformState() async {
    String platformVersion;
    //底层方法有可能会调用失败 所以要使用try on catch语句
    try {
      platformVersion = await FlutterPluginDemo.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    } catch (e){
      print('Exception: $e');
    }

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
