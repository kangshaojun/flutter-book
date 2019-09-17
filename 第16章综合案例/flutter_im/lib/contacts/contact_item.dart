import 'package:flutter/material.dart';
import './contact_vo.dart';

//好友列表项
class ContactItem extends StatelessWidget {
  //好友数据VO
  final ContactVO item;
  //标题名
  final String titleName;
  //图片路径
  final String imageName;
  //构建方法
  ContactItem({this.item, this.titleName, this.imageName});

  //渲染好友列表项
  @override
  Widget build(BuildContext context) {
    //列表项容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //每条列表项底部加一个边框
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像或图片
            imageName == null
                ? Image.network(
                    item.avatarUrl != ''
                        ? item.avatarUrl
                        : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
                    width: 36.0,
                    height: 36.0,
                    scale: 0.9,
                  )
                : Image.asset(
                    imageName,
                    width: 36.0,
                    height: 36.0,
                  ),
            //展示名称或标题
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              child: Text(
                titleName == null ? item.name ?? '暂时':titleName,
                style: TextStyle(fontSize: 18.0,color: Color(0xFF353535)),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
