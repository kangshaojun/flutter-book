import 'package:flutter/material.dart';
import 'dart:convert';
import '../model/good_list_model.dart';
import '../service/http_service.dart';

//商品列表页面
class GoodListPage extends StatefulWidget {
  _GoodListPageState createState() => _GoodListPageState();
}

class _GoodListPageState extends State<GoodListPage> {
  //初始化数据模型
  GoodListModel goodsList = GoodListModel([]);
  //滚动控制
  var scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //获取商品数据
    getGoods();
  }

  //获取商品数据
  void getGoods() async {
    //请求url
    var url = 'http://127.0.0.1:3000/getDioData';
    //请求参数 店铺Id
    var formData = {'shopId': '001'};

    //调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      //返回数据进行Json解码
      var data = json.decode(value.toString());
      //打印数据
      print('商品列表数据Json格式:::' + data.toString());

      //设置状态刷新数据
      setState(() {
        //将返回的Json数据转换成Model
        goodsList = GoodListModel.fromJson(data);
      });
    });
  }

  //商品列表项
  Widget _ListWidget(List newList, int index) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black12),
          )),
      //水平方向布局
      child: Row(
        children: <Widget>[
          //返回商品图片
          _goodsImage(newList, index),
          SizedBox(
            width: 10,
          ),
          //右侧使用垂直布局
          Column(
            children: <Widget>[
              _goodsName(newList, index),
              _goodsPrice(newList, index),
            ],
          ),
        ],
      ),
    );
  }

  //商品图片
  Widget _goodsImage(List newList, int index) {
    return Container(
      width: 150,
      height: 150,
      child: Image.network(newList[index].image,fit: BoxFit.fitWidth,),
    );
  }

  //商品名称
  Widget _goodsName(List newList, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 200,
      child: Text(
        newList[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  //商品价格
  Widget _goodsPrice(List newList, int index) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: 200,
      child: Row(
        children: <Widget>[
          Text(
            '价格:￥${newList[index].presentPrice}',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            '￥${newList[index].oriPrice}',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //通过商品列表数组长度判断是否有数据
    if(goodsList.data.length > 0){
      return ListView.builder(
          //滚动控制器
          controller: scrollController,
          //列表长度
          itemCount: goodsList.data.length,
          //列表项构造器
          itemBuilder: (context, index) {
            //列表项 传入列表数据及索引
            return _ListWidget(goodsList.data, index);
          },
        );
    }
    //商品列表没有数据时返回空容器
    return Container();

  }
}
