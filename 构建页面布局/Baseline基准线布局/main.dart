import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Baseline基准线布局示例'),
      ),
      body: new Row(
        //水平等间距排列子组件
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //设置基准线
          new Baseline(
            baseline: 80.0,
            //对齐字符底部水平线
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'AaBbCc',
              style: new TextStyle(
                fontSize: 18.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
          new Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: new Container(
              width: 40.0,
              height: 40.0,
              color: Colors.green,
            ),
          ),
          new Baseline(
            baseline: 80.0,
            baselineType: TextBaseline.alphabetic,
            child: new Text(
              'DdEeFf',
              style: new TextStyle(
                fontSize: 26.0,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(
    new MaterialApp(
      title: 'Baseline基准线布局示例',
      home: new LayoutDemo(),
    ),
  );
}
