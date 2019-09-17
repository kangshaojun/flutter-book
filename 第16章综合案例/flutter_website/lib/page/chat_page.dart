import 'package:flutter/material.dart';
import 'chat_message.dart';
import 'package:date_format/date_format.dart';
import 'package:provider/provider.dart';
import '../provider/websocket_provider.dart';
//聊天页面
class ChatPage extends StatefulWidget {
  @override
  State createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  //文本编辑控制器
  final TextEditingController textEditingController = TextEditingController();
  //输入框获取焦点
  FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //发送消息
  void handleSubmit(String text) {
    textEditingController.clear();
    //判断输出框内容是否为空
    if (text.length == 0 || text == '') {
      return;
    }
    //发送公共聊天消息
    Provider.of<WebSocketProvider>(context).sendMessage('chat_public', text);
  }

  //创建消息输入框组件
  Widget textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                //提示内容:请输入消息
                decoration: InputDecoration.collapsed(hintText: '请输入消息'),
                //文本编辑控制器
                controller: textEditingController,
                //发送消息
                onSubmitted: handleSubmit,
                //获取焦点
                focusNode: textFocusNode,
              ),
            ),
            //发送按钮容器
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              //发送按钮
              child: IconButton(
                icon: Icon(Icons.send),
                //按下发送消息
                onPressed: () => handleSubmit(textEditingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  //根据索引创建一个带动画的消息组件
  Widget messageItem(BuildContext context, int index) {
    //获取一条聊天消息
    var item = Provider.of<WebSocketProvider>(context).messages[index];
    //创建消息动画控制器
    var animate =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    //创建一个消息组件
    ChatMessage message = ChatMessage(
      //取用户名值
      item['userName'].toString(),
      //取消息内容值
      item['msg'].toString(),
      //创建消息时间
      formatDate(DateTime.now(), [HH, ':', nn, ':', ss]),
    );
    //读取出自己的userId 用于判断服务端转发过来的消息是否为自己发送的消息
    String tempId = Provider.of<WebSocketProvider>(context).userId;
    if (tempId == item['userId']) {
      message.isMe = true;
    } else {
      message.isMe = false;
    }
    //如果index等于0则执行动画 也就是最新的消息执行动画
    if (index == 0) {
      //开始动画
      animate.forward();
      //大小变化动画组件
      return SizeTransition(
        //指定非线性动画类型
        sizeFactor: CurvedAnimation(parent: animate, curve: Curves.easeInOut),
        axisAlignment: 0.0,
        //指定为当前消息组件
        child: message,
      );
    }
    //不加动画消息组件
    return message;
  }

  @override
  Widget build(BuildContext context) {
    //垂直布局
    return Column(
      children: <Widget>[
        //使用Consumer来获取WebSocketProvider对象
        Consumer<WebSocketProvider>(builder: (BuildContext context, WebSocketProvider websocketProvider, Widget child) {
          //获取消息列表数据
          var messages = websocketProvider.messages;
          return Flexible(
            //使用列表渲染消息
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              //消息组件渲染
              itemBuilder: messageItem,
              //消息条目数
              itemCount: messages.length,
            ),
          );
        }),
        //分隔线
        Divider(
          height: 1.0,
        ),
        //消息输入框及发送按钮
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: textComposerWidget(),
        )
      ],
    );
  }
}
