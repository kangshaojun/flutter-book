import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Container容器布局示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //返回一个Container对象
    Widget container = Container(
      //添加装饰效果
      decoration: BoxDecoration(
        //背景色
        color: Colors.grey,
      ),
      //子元素指定为一个垂直水平嵌套布局的组件
      child: Column(
        children: <Widget>[
          //水平布局
          Row(
            children: <Widget>[
              //使用Expanded防止内容溢出
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  //添加边框样式
                  decoration: BoxDecoration(
                    //上下左右边框设置为宽度10.0 颜色为蓝灰色
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    //上下左右边框弧度设置为8.0
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  //上下左右增加边距
                  margin: const EdgeInsets.all(4.0),
                  //添加图片
                  child: Image.asset('images/1.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/2.jpeg'),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/3.jpeg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/2.jpeg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Container容器布局示例'),
      ),
      body: container,
    );
  }
}