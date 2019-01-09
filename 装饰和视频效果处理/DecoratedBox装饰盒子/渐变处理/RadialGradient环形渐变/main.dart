import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RadialGradient环形渐变效果'),
      ),
      body: new Center(
        child: new DecoratedBox(
          decoration: new BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(-0.0, -0.0), //中心点偏移量,x和y均为0.0表示在正中心位置
              radius: 0.50, //圆形半径
              //渐变颜色数据集
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
            ),
          ),
          child: new Container(
            width: 280.0,
            height: 280.0,
            child: new Center(
              child: Text(
                'RadialGradient环形渐变效果',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    new MaterialApp(
      title: 'DecoratedBox装饰盒子示例',
      home: new LayoutDemo(),
    ),
  );
}
