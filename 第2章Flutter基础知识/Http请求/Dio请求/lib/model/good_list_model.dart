//商品列表数据模型
class GoodListModel{
  //状态码
  String code;
  //状态信息
  String message;
  //商品列表数据
  List<GoodModel> data;

  //构造方法 初始化时可传入空数组[]即可
  GoodListModel(this.data);

  //通过传入Json数据转换成数据模型
  GoodListModel.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = List<GoodModel>();
      //循环迭代Json数据并将其每一项数据转换成GoodModel
      json['data'].forEach((v){
        data.add(GoodModel.fromJson(v));
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

//商品信息模型
class GoodModel{
  //商品图片
  String image;
  //原价
  int oriPrice;
  //现有价格
  int presentPrice;
  //商品名称
  String name;
  //商品Id
  String goodsId;

  //构造方法
  GoodModel({this.image,this.oriPrice,this.presentPrice,this.name,this.goodsId});

  //通过传入Json数据转换成数据模型
  GoodModel.fromJson(Map<String,dynamic> json){
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    name = json['name'];
    goodsId = json['goodsId'];

  }

  //将数据模型转换成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['name'] = this.name;
    data['goodsId'] = this.goodsId;
    return data;
  }

}