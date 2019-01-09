import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '层叠定位布局示例',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('层叠定位布局示例'),
      ),
      body: new Center(
        //添加层叠布局
        child: new Stack(
          children: <Widget>[
            //添加网络图片
            new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1541655494719&di=6b49d24b5172a34828b9d6506e4bf100&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn11%2F266%2Fw640h426%2F20180813%2Fce56-hhqtawx8254771.jpg'),
            //设置定位布局
            new Positioned(
                bottom: 50.0,
                right: 50.0,
                child: new Text(
                  'hi flutter',
                  style: new TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                    color: Colors.white,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
