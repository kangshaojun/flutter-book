import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'client.dart';
import 'database.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //测试数据
  List<Client> clients = [
    Client(name: "张三", age: 20, sex: false),
    Client(name: "李四", age: 22, sex: true),
    Client(name: "王五", age: 28, sex: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sqflite示例")),
      body: FutureBuilder<List<Client>>(
        //获取所有Client
        future: DBProvider.db.getAllClients(),
        builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
          //如果有数据用列表展示
          if (snapshot.hasData) {
            return ListView.builder(
              //数据项个数 对应返回的表记录的条数
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                //数据项Client对象
                Client item = snapshot.data[index];
                //滑动删除组件
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  //删除Client
                  onDismissed: (direction) {
                    //根据id删除Client对象
                    DBProvider.db.deleteClient(item.id);
                  },
                  child: ListTile(
                    //展示Client对象数据
                    title: Text(item.name.toString()),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        //更新性别
                        DBProvider.db.updateSex(item);
                        setState(() {});
                      },
                      //显示性别
                      value: item.sex,
                    ),
                  ),
                );
              },
            );
          }
          //没有数据显示缓冲动画
          else {
            return Center(
                child: CircularProgressIndicator()
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //随机取测试数据中的一条数据作为Client对象
          Client rnd = clients[math.Random().nextInt(clients.length)];
          //新增加一个Client对象
          await DBProvider.db.insertClient(rnd);
          setState(() {});
        },
      ),
    );
  }
}
