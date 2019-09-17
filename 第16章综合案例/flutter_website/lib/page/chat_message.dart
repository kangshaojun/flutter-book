import 'package:flutter/material.dart';
//聊天消息组件
class ChatMessage extends StatelessWidget {
  //判断是否是自己发的消息
  bool isMe = false;
  //用户名
  String userName;
  //消息内容
  String message;
  //消息创建时间
  String createAt;
  //构建函数 传入用户名,消息及创建时间参数
  ChatMessage( this.userName,this.message, this.createAt);

  @override
  Widget build(BuildContext context) {
    //自己发的消息放在消息列表的右边
    if(isMe){
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        //水平布局 左侧为消息 右侧为头像
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //左侧空余部分
            Expanded(
              child: Container(),
            ),
            //垂直排列 消息时间 消息内容
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(createAt,style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(message),
                )
              ],
            ),
            //我的头像
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                child: Text('Me'),
              ),
            ),
          ],
        ),
      );
    }
    //别人发的消息放在消息列表的右边
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      //水平布局 左侧为头像 右侧为消息
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //最左侧为头像
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              //使用用户名填充头像
              child: Text(userName),
            ),
          ),
          //垂直布局 消息时间 消息内容
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(createAt,style: Theme.of(context).textTheme.subhead),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(message),
              )
            ],
          ),
        ],
      ),
    );
  }
}
