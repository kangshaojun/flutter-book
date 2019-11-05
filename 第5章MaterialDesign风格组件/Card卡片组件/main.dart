import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Card布局示例',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var card = SizedBox(
      //限定高度
      height: 250.0,
      //添加Card组件
      child: Card(
        //垂直布局
        child: Column(
          children: <Widget>[
            ListTile(
              //标题
              title: Text(
                '深圳市南山区深南大道',style: TextStyle(fontWeight: FontWeight.w300),
              ),
              //子标题
              subtitle: Text('XX有限公司'),
              //左侧图标
              leading: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            //分隔线
            Divider(),
            ListTile(
              title: Text(
                '深圳市罗湖区沿海大道',style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: Text('XX培训机构'),
              leading: Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Card布局示例'),
      ),
      body: Center(
        child: card,
      ),
    );
  }
}
