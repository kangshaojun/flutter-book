import 'package:flutter/material.dart';

//产品VO类
class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: '传递数据示例',
    //商品列表
    home: ProductList(
      //构造20条数据
      products: List.generate(20, (i) => Product('商品 $i', '这是一个商品详情 $i')),
    ),
  ));
}

//商品列表页
class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      //商品列表
      body: ListView.builder(
        //列表长度
          itemCount: products.length,
          //列表项构造器
          itemBuilder: (context, index) {
            //返回列表项
            return ListTile(
              title: Text(products[index].title),
              //点击跳转至商品详情页 传入Product对象
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ProductDetail(product: products[index])),
                );
              },
            );
          }),
    );
  }
}

//商品详情页
class ProductDetail extends StatelessWidget {
  //商品数据
  final Product product;

  //构造方法 将传入的商品数据赋值给product
  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //展示数据
        title: Text("${product.title}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        //展示数据
        child: Text('${product.description}'),
      ),
    );
  }
}
