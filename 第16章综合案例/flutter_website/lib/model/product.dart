//产品列表数据模型
class ProductListModel{
  //状态码
  String code;
  //状态信息
  String message;
  //产品列表数据
  List<ProductModel> data;

  //构造方法 初始化时可传入空数组[]即可
  ProductListModel(this.data);

  //通过传入Json数据转换成数据模型
  ProductListModel.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = List<ProductModel>();
      //循环迭代Json数据并将其每一项数据转换成ProductModel
      json['data'].forEach((v){
        data.add(ProductModel.fromJson(v));
      });
    }
  }

  //将数据模型转换成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

//产品数据模型
class ProductModel{
  String productId;//产品id
  String desc;//产品描述
  String type;//产品类型
  String name;//产品名称
  String imageUrl;//产品图片路径
  String point;//产品特点

  //构造方法
  ProductModel({this.productId,this.desc,this.type,this.name,this.imageUrl,this.point});

  //通过传入Json数据转换成数据模型
  ProductModel.fromJson(Map<String,dynamic> json){
    productId = json['productId'];
    desc = json['desc'];
    type = json['type'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    point = json['point'];
  }

  //将数据模型转换成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['productId'] = this.productId;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['point'] = this.point;
    return data;
  }

}