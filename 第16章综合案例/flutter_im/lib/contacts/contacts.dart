import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './contact_sider_list.dart';
import './contact_item.dart';
import './contact_header.dart';
import './contact_vo.dart';

//好友列表主页面
class Contacts extends StatefulWidget {
  @override
  ContactState createState() => ContactState();

}

class ContactState extends State<Contacts>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //主体实现
      body: ContactSiderList(
        //好友列表数据
          items: contactData,
          //好友列表头构造器
          headerBuilder: (BuildContext context, int index){
            return Container(
              //好友列表头
              child: ContactHeader(),
            );
          },
        //好友列表项构造器
          itemBuilder:  (BuildContext context, int index){
            return Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              //好友列表项
              child: ContactItem(item:contactData[index]),
            );
          },
        //字母构造器
          sectionBuilder: (BuildContext context, int index){
            return Container(
              height: 32.0,
              padding: const EdgeInsets.only(left:14.0),
              color: Colors.grey[300],
              alignment: Alignment.centerLeft,
              //显示字母
              child: Text(
                contactData[index].seationKey,
                style: TextStyle(fontSize: 14.0,color: Color(0xff909090)),
              ),
            );
          },
      ),
    );
  }
}