//客户数据模型类
class Client {
  //id
  int id;
  //姓名
  String name;
  //年龄
  int age;
  //性别
  bool sex;

  Client({this.id, this.name, this.age, this.sex,});

  //将JSON数据转换成数据模型
  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        sex: json["sex"] == 1,
      );

  //将数据模型转换成JSON
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "sex": sex,
      };
}

