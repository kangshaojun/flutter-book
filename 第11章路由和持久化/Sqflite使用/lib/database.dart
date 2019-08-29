import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'client.dart';
import 'package:sqflite/sqflite.dart';

//数据库操作封装类
class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  //获取Database对象
  Future<Database> get database async {
    //使用单例模式创建Database对象
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  //初始化数据库
  initDB() async {
    //获取文档目录对象
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //获取默认数据库位置(在Android上，它通常是data/data/<package_name>/databases,在iOS上，它是Documents目录)
    String path = join(documentsDirectory.path, "client.db");
    //打开数据库 传入路径 版本号 打开完成回调函数
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          //数据库创建完成后创建Client表
          await db.execute("CREATE TABLE Client ("
              "id INTEGER PRIMARY KEY,"
              "name TEXT,"
              "age INTEGER,"
              "sex BIT"
              ")");
    });
  }

  //新增Client
  insertClient(Client newClient) async {
    final db = await database;
    //获取表中最大的id再加1作为新的id
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Client");
    int id = table.first["id"];
    //向表中插入一条数据
    var raw = await db.rawInsert(
        "INSERT Into Client (id,name,age,sex)"
        " VALUES (?,?,?,?)",
        [id, newClient.name, newClient.age, newClient.sex]);
    return raw;
  }

  //修改性别
  updateSex(Client client) async {
    final db = await database;
    Client newClient = Client(
        id: client.id,
        name: client.name,
        age: client.age,
        sex: !client.sex);
    //更新当前Client的性别
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  //更新Client
  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  //根据id获取Client
  getClient(int id) async {
    final db = await database;
    //根据id查询表记录
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    //将查询返回的数据转换为Client对象并返回
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  //获取所有Client
  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list = res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  //根据id删除Client
  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  //删除所有Client
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}
