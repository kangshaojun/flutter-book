import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//MyApp不需要做状态处理，所以此组件继承StatelessWidget即可
class MyApp extends StatelessWidget {
  // 这个组件是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter示例',
      theme: ThemeData(
        //自定义主题
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '无状态和有状态组件示例'),
    );
  }
}

//主页需要继承自StatefulWidget
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //标题
  final String title;

  //必须重写createState方法
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//状态类必须继承State类,注意后面需要指定为<MyHomePage>
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;//计数器

  void _incrementCounter() {
    //调用State类里的setState方法来更改状态值，使得计数器加1
    setState(() {
      //计数器变量，每次点击让其加1
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //居中布局
      body: Center(

        //垂直布局
        child: Column(
          //主轴居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你点击右下角按钮的次数:',
            ),
            Text(
              '$_counter',//绑定计数器的值
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,//按下+号按钮调用自增函数
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
