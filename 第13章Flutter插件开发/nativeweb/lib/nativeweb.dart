import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//View创建完成回调
typedef void WebViewCreatedCallback(WebController controller);

//View上层组件
class NativeWeb extends StatefulWidget {

  //WebView创建完成回调
  final WebViewCreatedCallback onWebCreated;

  NativeWeb({Key key, @required this.onWebCreated,});

  @override
  _NativeWebState createState() => _NativeWebState();
}

class _NativeWebState extends State<NativeWeb>{

  @override
  Widget build(BuildContext context) {

    //判断当前平台是否为Android平台
    if(defaultTargetPlatform == TargetPlatform.android){
      //Android平台使用的是AndroidView组件
      return AndroidView(
        //viewType与原生层registerViewFactory的参数id对应
        viewType: 'nativeweb',
        //原生层视图创建完成回调
        onPlatformViewCreated: onPlatformViewCreated,
        //创建参数编解码器
        creationParamsCodec: const StandardMessageCodec(),
      );
      //判断当前平台是否为iOS平台
    } else if(defaultTargetPlatform == TargetPlatform.iOS){
      //iOS平台使用的是UiKitView组件
      return UiKitView(
        //viewType与原生层registerViewFactory的参数id对应
        viewType: 'nativeweb',
        //原生层视图创建完成回调
        onPlatformViewCreated: onPlatformViewCreated,
        //创建参数编解码器
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text('$defaultTargetPlatform 不支持此插件');

  }

  //视图创建完成 参数id为Platform原生层对应的视图View的id
  Future<void> onPlatformViewCreated(id) async{
    if(widget.onWebCreated == null){
      return;
    }
    widget.onWebCreated(WebController.init(id));
  }
}


/**
 * Web控制类
 * 创建MethodChannel及提供加载网页的方法
 */
class WebController {

  //定义方法通道
  MethodChannel _channel;

  WebController.init(int id){
    //视图id作为通道name的组成部分
    _channel = MethodChannel('nativeweb_$id');
  }

  //提供加载URL方法 参数为网址
  Future<void> loadUrl(String url) async{
    assert(url != null);
    return _channel.invokeMethod('loadUrl',url);
  }

}
