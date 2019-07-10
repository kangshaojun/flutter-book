import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter电池电量插件示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter电池电量插件示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //调用电池电量插件并实例化Battery对象
  Battery _battery = Battery();

  //定义本地电池状态变量
  BatteryState _batteryState;
  //注册事件流 接收电池状态值BatteryState
  StreamSubscription<BatteryState> _batteryStateSubscription;

  @override
  void initState() {
    super.initState();
    //监听电池状态值改变事件
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        //将返回的电池状态设置到本地变量
        _batteryState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('电池电量插件'),
      ),
      body: Center(
        //展示电量状态
        child: Text('$_batteryState'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.battery_unknown),
        onPressed: () async {
          //通过插件获取电池电量值
          final int batteryLevel = await _battery.batteryLevel;
          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              //展示电量值
              content: Text('电量: $batteryLevel%'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('确定'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //当组件销毁时取消监听电池状态
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription.cancel();
    }
  }
}
