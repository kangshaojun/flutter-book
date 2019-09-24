import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersistentDemo(),
    );
  }
}

//本地存储 使用key-value存储
class PersistentDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersistentDemoState();
}

class PersistentDemoState extends State<PersistentDemo> {
  //实例化本地存储对象
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //呢称及选择语言的值
  var controller = TextEditingController();
  bool value_dart = false;
  bool value_js = false;
  bool value_java = false;

  @override
  void initState() {
    super.initState();
    initFromCache();
  }

  @override
  void dispose() {
    super.dispose();
    controller = null;
  }

  //从缓存中获取信息填充
  void initFromCache() async {
    final SharedPreferences prefs = await _prefs;
    //根据键key获取本地存储的值value
    final value_nickname = prefs.getString("key_nickname");
    final value_dart = prefs.getBool("key_dart");
    final value_js = prefs.getBool("key_js");
    final value_java = prefs.getBool("key_java");

    //获取到缓存中的值后，使用setState更新界面信息
    setState(() {
      controller.text = (value_nickname == null ? "" : value_nickname);
      this.value_dart = (value_dart == null ? false : value_dart);
      this.value_js = (value_js == null ? false : value_js);
      this.value_java = (value_java == null ? false : value_java);
    });
  }

  //保存界面的输入选择信息
  void saveInfo(String value_nickname) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("key_nickname", value_nickname);
    prefs.setBool("key_dart", value_dart);
    prefs.setBool("key_js", value_js);
    prefs.setBool("key_java", value_java);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SharedPreferences示例'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: '昵称:',
                  hintText: '请输入名称',
                ),
              ),
              Text('你喜欢的编程语言'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Dart'),
                  Switch(
                    value: value_dart,
                    onChanged: (isChanged) {
                      //设置状态改变要存储的值
                      setState(() {
                        this.value_dart = isChanged;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('JavaScript'),
                  Switch(
                    value: value_js,
                    onChanged: (isChanged) {
                      setState(() {
                        this.value_js = isChanged;
                      });
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Java'),
                  Switch(
                    value: value_java,
                    onChanged: (isChanged) {
                      setState(() {
                        this.value_java = isChanged;
                      });
                    },
                  )
                ],
              ),
              MaterialButton(
                child: Text('保存'),
                onPressed: () {
                  saveInfo(controller.text);
                },
              ),
            ],
          ),
        )
    );
  }
}