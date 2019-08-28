import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinearGradient线性渐变效果'),
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            //线性渐变
            gradient: LinearGradient(
              begin: const FractionalOffset(0.5, 0.0),//起始偏移量
              end: const FractionalOffset(1.0, 1.0),//终止偏移量
              //渐变颜色数据集
              colors: <Color>[
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.grey,
              ],
            ),
          ),
          child: Container(
            width: 280.0,
            height: 280.0,
            child: Center(
              child: Text(
                'LinearGradient线性渐变效果',
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
    MaterialApp(
      title: 'DecoratedBox装饰盒子示例',
      home: LayoutDemo(),
    ),
  );
}
