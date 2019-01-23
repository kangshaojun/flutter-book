import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: 'Drawer抽屉组件示例',
    home: new LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text('Drawer抽屉组件示例'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //设置用户信息 头像、用户名、Email等
            UserAccountsDrawerHeader(
              accountName: new Text(
                "玄微子",
              ),
              accountEmail: new Text(
                "xuanweizi@163.com",
              ),
              //设置当前用户头像
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("images/1.jpeg"),
              ),
              onDetailsPressed: () {},
              //属性本来是用来设置当前用户的其他账号的头像 这里用来当QQ二维码图片展示
              otherAccountsPictures: <Widget>[
                new Container(
                  child: Image.asset('images/code.jpeg'),
                ),
              ],
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens)),//导航栏菜单
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.photo)),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi)),
              title: Text('免流量特权'),
            ),
          ],
        ),
      ),
    );

  }
}




