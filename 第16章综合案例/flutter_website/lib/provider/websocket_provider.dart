import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import '../utils/random_string.dart';
import '../conf/configure.dart';
//聊天数据处理
class WebSocketProvider with ChangeNotifier{
  //用户Id
  var userId = '';
  //用户名称
  var userName = '';
  //聊天消息
  var messages = [];
  //WebSocket对象
  IOWebSocketChannel channel;
  //初始化
  init() async {
    //使用随机数创建userId
    userId = randomNumeric(6);
    //使用随机数创建userName
    userName = "u_" + randomNumeric(6);
    return await createWebsocket();
  }
  //创建并连接Socket服务器
  createWebsocket() async {
    //连接Socket服务器
    channel = await IOWebSocketChannel.connect('ws://' + Config.IP + ':' + Config.PORT);
    //定义加入房间消息
    var message = {
    'type': 'joinRoom',
    'userId': userId,
    'userName': userName,
    };
    //Json编码
    String text = json.encode(message).toString();
    //发送消息至服务器
    channel.sink.add(text);
    //监听到服务器返回消息
    channel.stream.listen((data) => listenMessage(data),onError: onError,onDone: onDone);
  }
  //监听服务端返回消息
  void listenMessage(data){
    //Json解码
    var message = jsonDecode(data);
    print("receive message:" + data);
    //接收到消息 判断消息类型为公共聊天chat_public
    if (message['type'] == 'chat_public'){
      //插入消息至消息列表
      messages.insert(0, message);
    }
    //通知聊天页面刷新数据
    notifyListeners();
  }
  //发送消息
  void sendMessage(type,data){
    //定义发送消息对象
    var message = {
      //消息类型
      "type": 'chat_public',
      'userId': userId,
      'userName': userName,
      //消息内容
      "msg": data
    };
    //Json编码
    String text = json.encode(message).toString();
    print("send message:" + text);
    //发送消息至服务器
    channel.sink.add(text);
  }
  //监听消息错误回调方法
  void onError(error){
    print('error:${error}');
  }
  //当WebSocket断开回调方法 此处可以做重连处理
  void onDone() {
    print('WebSocket断开了');
  }
  //前端主动关闭WebSocket处理
  void closeWebSocket(){
    //关闭链接
    channel.sink.close();
    print('关闭WebSocket');
    notifyListeners();
  }
}