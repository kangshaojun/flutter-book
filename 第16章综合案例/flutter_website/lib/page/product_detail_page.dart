import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import '../model/product_detail_model.dart';
import '../service/http_service.dart';
import '../provider/product_detail_provider.dart';
import '../conf/configure.dart';

//产品详情页面
class ProductDetailPage extends StatefulWidget {
  //传入产品Id
  final String productId;

  ProductDetailPage(this.productId);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    //获取产品详情
    getProductDetail();
  }
  //获取产品详情
  void getProductDetail() async {
    //请求url
    var url = 'http://' + Config.IP + ':' + Config.PORT + '/getProductDetail';
    //请求参数产品Id
    var formData = {"productId": widget.productId};
    print(widget.productId);
    //调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      //打印数据
      print('产品详情数据Json格式:::' + data.toString());
      //将Json数据转换成ProductDetailModel
      ProductDetailModel productDetailData = ProductDetailModel.fromJson(data);
      //设置ProductDetailProvider里的产品详情数据
      if (productDetailData.data != null) {
        Provider.of<ProductDetailProvider>(context).getProductDetail(productDetailData.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //根据Consumer获取ProductDetailProvider对象
    return Consumer<ProductDetailProvider>(builder: (BuildContext context, ProductDetailProvider productProvider, Widget child) {
      //获取产品详情数据
      ProductDetail detail = productProvider.productDetail;
      if (detail != null) {
        return Scaffold(
          appBar: AppBar(
            title: Text('产品详情'),
          ),
          //使用ListView可以使得产品图片滚动
          body: ListView(
            children: <Widget>[
              //展示Html数据
              Html(
                data: detail.productDetail,
              ),
            ],
          ),
        );
      } else {
        return Scaffold(
            appBar: AppBar(
              title: Text('产品详情'),
            ),
            body: Center());
      }
    });
  }
}
