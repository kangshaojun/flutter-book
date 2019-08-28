import 'package:flutter/material.dart';

//第二个页面
class SecondPage extends StatelessWidget {
  //传递参数值
  final String goodId;

  SecondPage(this.goodId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //显示传递参数值
            Text(
              '$goodId',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  //出栈带上参数 返回至第一个页面
                  Navigator.pop(context, '第二个页面返回参数($goodId)');
                },
                child: Text('点击返回'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
