import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //使用MultiProvider可以创建多个顶层共享数据
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => Counter()),
      ],
      child: MaterialApp(
        title: "Provider示例",
        home: FirstPage(),
      ),
    );
  }
}

//第一个页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            //路由跳转至第二页
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondPage();
                })),
          ),
        ],
      ),
      body: Center(
        //获取计数器中的count值
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //调用数据模型中的increment方法更改数据
          Provider.of<Counter>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//第二个页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        //获取计数器中的count值
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //调用数据模型中的increment方法更改数据
          Provider.of<Counter>(context).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/**
 * 计数器类Counter即为数据Model,实际上就是状态。
 * Counter不仅储存了数据，而且还包含了更改数据的方法，并暴露相关数据。
 * 使用mixin混入ChangeNotifier类，这个类能够自动管理所有听众。
 * 当调用notifyListeners时，它会通知所有听众进行刷新。
 */
class Counter with ChangeNotifier {

  //存储数据
  int _count = 0;
  //提供外部能够访问的数据
  int get count => _count;

  //提供更改数据的方法
  void increment(){
    _count++;
    //通知所有听众进行刷新
    notifyListeners();
  }
}