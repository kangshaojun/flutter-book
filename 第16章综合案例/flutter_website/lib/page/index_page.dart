import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_page.dart';
import 'chat_page.dart';
import 'home_page.dart';
import '../provider/websocket_provider.dart';
import '../provider/current_index_provider.dart';
//索引页面主要用来切换主要界面
class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  //首页
  HomePage homePage;
  //产品页
  ProductPage productPage;
  //聊天页
  ChatPage chatPage;
  //用于判断WebSocket是否初始化
  bool socketInited = false;

  //根据当前索引返回不同的页面
  currentPage(){
    //获取当有页面索引
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    switch(currentIndex){
      case 0:
        if(homePage == null){
          homePage = HomePage();
        }
        return homePage;
      case 1:
        if(productPage == null){
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if(chatPage == null){
          chatPage = ChatPage();
        }
        return chatPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 初始化WebSocket这里需要做一个判断
     * 首次初始化完成需要将socketInited置为true
     * 否则当页面刷新时会导致WebSocket多次连接从而创建多个实例
     */
    if(!socketInited) {
      Provider.of<WebSocketProvider>(context).init();
      socketInited = true;
    }
    //获取当前索引
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter企业站实战'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          //右侧内边距
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            //探索按钮
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
              ),
            ),
          ),
        ],
      ),
      //当前页面
      body: currentPage(),
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
          //通过fixedColor设置选中item 的颜色
          type: BottomNavigationBarType.fixed,
          //当前索引
          currentIndex: currentIndex,
          onTap: ((index) {
            //点击切换当前索引
            Provider.of<CurrentIndexProvider>(context).changeIndex(index);
          }),
          //底部导航栏
          items: [
            BottomNavigationBarItem(
              title: Text(
                '首页',
              ),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text(
                '产品',
              ),
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              title: Text(
                '联系我们',
              ),
              icon: Icon(Icons.insert_comment),
            ),
          ]),
    );
  }
}
