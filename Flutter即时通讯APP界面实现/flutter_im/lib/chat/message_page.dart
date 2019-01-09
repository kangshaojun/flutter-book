import 'package:flutter/material.dart';
import './message_data.dart';
import './message_item.dart';

//聊天主页面
class MessagePage extends StatefulWidget{
  @override
  MessagePageState createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //构造列表
      body: ListView.builder(
        //传入数据长度
        itemCount: messageData.length,
          //构造列表项
          itemBuilder: (BuildContext context, int index){
            //传入messageData返回列表项
            return new MessageItem(messageData[index]);
          }
      ),
    );
  }
}