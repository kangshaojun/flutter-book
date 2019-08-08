import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: '水平布局示例',
    home: LayoutDemo(),
  ),
);

class LayoutDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('水平布局示例'),
      ),
      //水平布局
      body: Row(
        children: <Widget>[
          Expanded(
            child: Text('左侧文本', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('中间文本', textAlign: TextAlign.center),
          ),
          //右侧图标
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
