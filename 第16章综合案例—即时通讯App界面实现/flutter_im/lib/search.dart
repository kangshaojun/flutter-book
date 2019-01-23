import 'package:flutter/material.dart';
import './common/touch_callback.dart';

//搜索模块
class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  //定义焦点节点
  FocusNode focusNode = new FocusNode();

  //请求获取焦点
  _requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  //返回一个文本组件
  _getText(String text) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child: Text(
        text,
        //添加文本样式
        style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19)),
      ),
    );
  }

  //搜索页面渲染
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //顶部留一定距离
        margin: const EdgeInsets.only(top: 25.0),
        //整体垂直布局
        child: Column(
          //水平方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //顶部导航栏 包括返回按钮 搜索框及麦克风按钮
            Stack(
              children: <Widget>[
                //使用触摸回调组件
                TouchCallBack(
                  isfeed: false,
                  onPressed: () {
                    //使用导航器返回上一个页面
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                    //添加返回按钮
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                //搜索框容器
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: const EdgeInsets.only(left: 50.0, right: 10.0),
                  //搜索框底部边框
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.green)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        //输入框
                        child: TextField(
                          //请求获取焦点
                          focusNode: _requestFocus(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                              hintText: '搜索', border: InputBorder.none),
                        ),
                      ),
                      //添加麦克风图标
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.mic,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                //对齐方式采用均匀对齐
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //第一行搜索项
                children: <Widget>[
                  _getText('朋友'),
                  _getText('聊天'),
                  _getText('群组'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //第二行搜索项
                  _getText('Flutter'),
                  _getText('Dart'),
                  _getText('C++'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
