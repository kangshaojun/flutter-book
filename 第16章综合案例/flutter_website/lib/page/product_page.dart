import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../model/product.dart';
import '../service/http_service.dart';
import '../provider/product_provider.dart';
import '../style/index.dart';
import '../router/application.dart';
import '../conf/configure.dart';
//产品页面
class ProductPage extends StatefulWidget{
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage>{

  @override
  void initState(){
    super.initState();
    //首次进入产品页面 加载产品列表数据
    getProductList(false);
  }

  GlobalKey<RefreshFooterState> footerKey = GlobalKey<RefreshFooterState>();
  //滚动控制
  var scrollController = ScrollController();

  //获取产品数据 isMore表示加载更多数据 上拉加载数据时使用
  void getProductList(bool isMore) async {
    //请求url
    var url = 'http://' + Config.IP + ':' + Config.PORT + '/getProducts';
    //请求参数
    var formData = {};
    //调用请求方法传入url及表单数据
    await request(url, formData: formData).then((value) {
      var data = json.decode(value.toString());
      //打印数据
      print('产品列表数据Json格式:::' + data.toString());
      //将Json数据转换成ProductListModel
      ProductListModel productList = ProductListModel.fromJson(data);
      //将返回的数据放入ProductProvider里
      if (productList.data == null) {
        Provider.of<ProductProvider>(context).getProductList([]);
      } else {
        if(isMore){
          //设置更多产品数据 追加列表数据
          Provider.of<ProductProvider>(context).addProductList(productList.data);
        }else{
          //设置产品数据 首次进入产品页面加载使用
          Provider.of<ProductProvider>(context).getProductList(productList.data);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      //使用Consumer获取ProductProvider对象
      builder: (BuildContext context, ProductProvider productProvider, Widget child) {
        //获取产品列表数据
        List<ProductModel> productList = productProvider.productList;
        //判断产品列表里是否有数据
        if (productList.length > 0) {
          return Container(
              width: 400,
              //加载刷新组件
              child: EasyRefresh(
                //底部上拉加载处理
                refreshFooter: ClassicsFooter(
                  key: footerKey,
                  bgColor: Colors.white,
                  textColor: Color.fromRGBO(132, 95, 63, 1.0),
                  moreInfoColor: Color.fromRGBO(132, 95, 63, 1.0),
                  showMore: true,
                  noMoreText: '加载更多',
                  moreInfo: '加载中',
                  //'加载中',
                  loadReadyText: '上拉加载', //'上拉加载',
                ),
                //数据列表
                child: ListView.builder(
                  //滚动控制
                  controller: scrollController,
                  //产品列表长度
                  itemCount: productList.length,
                  //产品列表项构造器
                  itemBuilder: (context, index) {
                    //列表项
                    return _ListWidget(productList, index);
                  },
                ),
                //加载更多
                loadMore: () async {
                  getProductList(true);
                },
              ),
            );
        } else {
          return Text('暂时没有数据');
        }
      },
    );
  }

  //商品列表项
  Widget _ListWidget(List newList, int index) {
    //根据索引获取产品数据
    ProductModel item = newList[index];

    return InkWell(
      onTap: (){
        //路由跳转至产品详情页
        Application.router.navigateTo(context, "/detail?productId=${item.productId}");
      },
      //列表项背景
      child: Container(
        color: ProductColors.bgColor,
        padding: EdgeInsets.only(
          top: 5.0,
          right: 5.0,
        ),
        //水平布局
        child: Row(
          children: <Widget>[
            //产品图片
            Image.network(
              item.imageUrl,
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color:ProductColors.divideLineColor,
                        )
                    )
                ),
                //产品信息垂直布局
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //产品描述
                    Text(
                      item.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //水平布局
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        //产品类型
                        Text(
                          item.type,
                          style: TextStyle(
                            fontSize: 16.0,
                            color:ProductColors.typeColor,
                          ),
                        ),
                        //产品特点
                        item.point == null ? SizedBox():Container(
                          child: Text(
                            item.point,
                            style: TextStyle(
                              color:ProductColors.piontColor,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          margin: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(border: Border.all(width: 1,color: ProductColors.piontColor)),
                        ),
                      ],
                    ),
                    //产品名称
                    Text(
                      item.name,
                      style: ProductFonts.itemNameStype,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}