import 'package:flutter/material.dart';

class ContactVO {
  //字母排列值
  String seationKey;
  //名称
  String name;
  //头像url
  String avatarUrl;
  //构造函数
  ContactVO({@required this.seationKey,this.name,this.avatarUrl});
}
//好友数据集
List<ContactVO> contactData = [
  new ContactVO(
    seationKey: 'A',
    name: 'A张三',
    avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540633615163&di=e6662df8230b7e8a87cf0017df7252b7&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fac345982b2b7d0a2d1f5b989c0ef76094b369ae2.jpg',
  ),
  new ContactVO(
      seationKey: 'A',
      name: '阿黄',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540441383345&di=39fe0512213122b232a7861363d86ba4&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F8435e5dde71190ef0795a828c41b9d16fcfa60de.jpg'),
  new ContactVO(
      seationKey: 'B',
      name: '波波',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540441383345&di=41a9c62adb0702595cbeab1eb7935f66&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F3b292df5e0fe992532fd5c7e3fa85edf8db1712e.jpg'),
  new ContactVO(
      seationKey: 'C',
      name: '陈可',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529317279409&di=c04fca2322c5fd92860d5445ac67f5ba&imgtype=0&src=http%3A%2F%2Fimg.duoziwang.com%2F2018%2F07%2F201812398230049.jpg'),
  new ContactVO(
      seationKey: 'C',
      name: '参谋长',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540441590992&di=6b6615dbaecc17a83517b8b5bb8853fb&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F34fae6cd7b899e51703453e048a7d933c9950d8f.jpg'),
  new ContactVO(
      seationKey: 'D',
      name: '杜一',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529317279343&di=a85a9844a259f97a0a3349ad0ca0bdfb&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2017-12%2F2017120617245278991.jpg'),
  new ContactVO(
      seationKey: 'D',
      name: '东方红',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529317279342&di=7eae385ce6b52688ec1ae23efb6df2b6&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-2%2F2018020913274626058.jpg'),
  new ContactVO(
      seationKey: 'D',
      name: '大表哥',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529317279332&di=4ce7a79c1969de3afd25ff12415a9a86&imgtype=0&src=http%3A%2F%2Fimg.duoziwang.com%2F2018%2F07%2F201812398230061.jpg'),
  new ContactVO(
      seationKey: 'F',
      name: '飞机',
      avatarUrl:
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=889175251,2001539136&fm=27&gp=0.jpg'),
  new ContactVO(
      seationKey: 'G',
      name: '高大上',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529317923619&di=c7c1e8e86f028a98f5f1287f08185dda&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2017-12%2F15131353255776823.jpg'),
  new ContactVO(
      seationKey: 'H',
      name: 'herbie',
      avatarUrl:
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4174685487,4080018153&fm=11&gp=0.jpg'),
  new ContactVO(
      seationKey: 'H',
      name: '何小冉',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529318082533&di=12e4f3d6b8bff6da451502fef002c1c1&imgtype=0&src=http%3A%2F%2Fpic.qqtn.com%2Fup%2F2018-6%2F2018060510054743138.jpg'),
  new ContactVO(
      seationKey: 'J',
      name: '姬如雪',
      avatarUrl:
      'http://img5.duitang.com/uploads/item/201609/26/20160926124027_vxRkt.jpeg'),
  new ContactVO(
      seationKey: 'J',
      name: 'JC',
      avatarUrl:
      ''),
  new ContactVO(
      seationKey: 'J',
      name: 'JCZ',
      avatarUrl:
      ''),
  new ContactVO(seationKey: 'L', name: '联通', avatarUrl: ''),
  new ContactVO(
      seationKey: 'L',
      name: '留学生',
      avatarUrl: 'http://www.qqzhi.com/uploadpic/2014-09-25/120539135.jpg'),
  new ContactVO(
      seationKey: 'L',
      name: '李先森',
      avatarUrl: 'http://www.qqzhi.com/uploadpic/2015-01-16/110701410.jpg'),
  new ContactVO(
      seationKey: 'L',
      name: '罗森',
      avatarUrl: 'http://www.qqzhi.com/uploadpic/2014-10-14/001343706.jpg'),
  new ContactVO(
      seationKey: 'L',
      name: '老司机',
      avatarUrl:
      'http://img.bitscn.com/upimg/allimg/c160107/1452134O464060-32cR.jpg'),
  new ContactVO(
      seationKey: 'L',
      name: '辣眼睛',
      avatarUrl:
      ''),
  new ContactVO(seationKey: 'M', name: 'Mary', avatarUrl: ''),
  new ContactVO(
      seationKey: 'M',
      name: 'Master',
      avatarUrl:
      ''),
  new ContactVO(seationKey: 'P', name: '彭于晏', avatarUrl: ''),
  new ContactVO(
      seationKey: 'P',
      name: '彭简',
      avatarUrl:
      ''),
  new ContactVO(
      seationKey: 'Q',
      name: '乔大',
      avatarUrl:
      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2957447029,2344598237&fm=27&gp=0.jpg'),
  new ContactVO(
      seationKey: 'Q',
      name: '乔小',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529320656524&di=3840b5e429f92459c3a5211c904a74b8&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201406%2F29%2F20140629020408_ZtckA.jpeg'),
  new ContactVO(
      seationKey: 'Q',
      name: '邱小玲',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529320656523&di=afbc5ec78d4a4f28efd20585c0acbdaf&imgtype=0&src=http%3A%2F%2Fcdnq.duitang.com%2Fuploads%2Fitem%2F201502%2F22%2F20150222145005_BGBCX.jpeg'),
  new ContactVO(
      seationKey: 'Q',
      name: '齐东宇',
      avatarUrl:
      'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1790389375,489698159&fm=27&gp=0.jpg'),
  new ContactVO(
      seationKey: 'R',
      name: 'rogerMan',
      avatarUrl:
      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=179495508,198350193&fm=27&gp=0.jpg'),
  new ContactVO(
      seationKey: 'S',
      name: '石头熊',
      avatarUrl:
      'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1811676222,3366694286&fm=27&gp=0.jpg'),
  new ContactVO(seationKey: 'S', name: '孙丽', avatarUrl: ''),
  new ContactVO(
      seationKey: 'S',
      name: '沈家',
      avatarUrl:
      ''),
  new ContactVO(
      seationKey: 'T',
      name: '天天',
      avatarUrl:
      'http://img.7139.com/file/201206/4f63c6678cefe6396e0c3d02e52dce47.jpg'),
  new ContactVO(
      seationKey: 'W',
      name: '薇薇安',
      avatarUrl:
      'http://image.bitauto.com/dealer/news/50001912/d140ad9a-5f2d-488d-aa09-7474cb8bc2d0.jpg'),
  new ContactVO(seationKey: 'X', name: '小猪', avatarUrl: ''),
  new ContactVO(
      seationKey: 'X',
      name: '小猪佩奇',
      avatarUrl:
      ''),
  new ContactVO(
      seationKey: 'X',
      name: '茜茜',
      avatarUrl:
      'http://dealer2.autoimg.cn/dealerdfs/g23/M10/C3/8E/620x0_1_q87_autohomedealer__wKgFV1hwh4eAY1azAABEQL7nzwY495.jpg'),
  new ContactVO(
      seationKey: 'Y',
      name: '杨洋',
      avatarUrl:
      ''),
  new ContactVO(
      seationKey: 'Z',
      name: '张一山',
      avatarUrl:
      'http://img4.duitang.com/uploads/item/201510/08/20151008222232_rXEve.png'),
];