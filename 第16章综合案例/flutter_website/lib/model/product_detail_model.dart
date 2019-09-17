//产品详情返回数据模型
class ProductDetailModel{
  //状态码
  String code;
  //状态信息
  String message;
  //产品详情数据
  ProductDetail data;

  //构造方法 初始化时可传入空数组[]即可
  ProductDetailModel(this.data);

  //通过传入Json数据转换成数据模型
  ProductDetailModel.fromJson(Map<String,dynamic> json){
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = ProductDetail.fromJson(json['data']);
    }
  }

  //将数据模型转换成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if(this.data != null){
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

//产品详情数据模型
class ProductDetail{
  String productId;//产品id
  String desc;//产品描述
  String type;//产品类型
  String name;//产品名称
  String imageUrl;//产品图片路径
  String point;//产品特点
  String productDetail;//产品详情

  //构造方法
  ProductDetail({this.productId,this.desc,this.type,this.name,this.imageUrl,this.point,this.productDetail});

  //通过传入Json数据转换成数据模型
  ProductDetail.fromJson(Map<String,dynamic> json){
    productId = json['productId'];
    desc = json['desc'];
    type = json['type'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    point = json['point'];
    productDetail = json['productDetail'];
  }

  //将数据模型转换成Json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['productId'] = this.productId;
    data['desc'] = this.desc;
    data['type'] = this.type;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['point'] = this.point;
    data['productDetail'] = this.productDetail;
    return data;
  }

}