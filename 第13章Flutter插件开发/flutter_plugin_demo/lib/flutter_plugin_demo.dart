import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginDemo {
  //定义通道方法MethodChannel 通道标识这个和原生代码是对应的要保持一致
  static const MethodChannel _channel =
  const MethodChannel('flutter_plugin_demo');

  //提供外部调用的方法 注意此方法要加异步处理
  static Future<String> get platformVersion async {
    //调用原生程序获取系统版本
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}
