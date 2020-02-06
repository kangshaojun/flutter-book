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
  ContactVO(
    seationKey: 'A',
    name: 'A家具销售',
    avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg',
  ),
  ContactVO(
    seationKey: 'A',
    name: '阿黄',
    avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg',
  ),
  ContactVO(
    seationKey: 'B',
    name: '波波',
    avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg',
  ),
  ContactVO(
    seationKey: 'C',
    name: '陈可',
    avatarUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540604543064&di=8aae52b40c5b4f0d2a2265b71ef1ba2c&imgtype=0&src=http%3A%2F%2Fcdnimg103.lizhi.fm%2Faudio_cover%2F2016%2F09%2F29%2F2559592964947348999_320x320.jpg',
  ),
  ContactVO(
    seationKey: 'C',
    name: '参谋长',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
  ),
  ContactVO(
    seationKey: 'D',
    name: '杜一',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
  ),
  ContactVO(
    seationKey: 'D',
    name: '东方红',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
  ),
  ContactVO(
    seationKey: 'D',
    name: '大表哥',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403360209&di=ec25c22642ec5e3858dc70a393ca0697&imgtype=0&src=http%3A%2F%2Fphotocdn.sohu.com%2F20110901%2FImg318072437.jpg',
  ),
  ContactVO(
    seationKey: 'F',
    name: '飞机',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403409663&di=dedd3829d437cd3dbaf0eff35843aba6&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46e22496026063f6246b60af82.jpg',
  ),
  ContactVO(
    seationKey: 'G',
    name: '高大上',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403409663&di=dedd3829d437cd3dbaf0eff35843aba6&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46e22496026063f6246b60af82.jpg',
  ),
  ContactVO(
    seationKey: 'H',
    name: 'herbie',
    avatarUrl:
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403409663&di=dedd3829d437cd3dbaf0eff35843aba6&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46e22496026063f6246b60af82.jpg',
  ),
  ContactVO(
      seationKey: 'H',
      name: '何小冉',
      avatarUrl:
      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1540403568416&di=5ee437e92b9cbc9246035a6353fa8417&imgtype=0&src=http%3A%2F%2Fi6.qhimg.com%2Ft014810bec6c531fc18.jpg'
  ),
  ContactVO(
      seationKey: 'J',
      name: '姬如雪',
      avatarUrl:
      ''
  ),
  ContactVO(
      seationKey: 'J',
      name: 'JC',
      avatarUrl:
      ''),
  ContactVO(
      seationKey: 'J',
      name: 'JCZ',
      avatarUrl:
      ''),
  ContactVO(seationKey: 'L', name: '联通', avatarUrl: ''),
  ContactVO(
      seationKey: 'L',
      name: '留学生',
      avatarUrl:''),
  ContactVO(
      seationKey: 'L',
      name: '李先森',
      avatarUrl:''),
  ContactVO(
      seationKey: 'L',
      name: '罗森',
      avatarUrl:''),
  ContactVO(
      seationKey: 'L',
      name: '老司机',
      avatarUrl:''),
  ContactVO(
      seationKey: 'L',
      name: '辣眼睛',
      avatarUrl:
      ''),
  ContactVO(seationKey: 'M', name: 'Mary', avatarUrl: ''),
  ContactVO(
      seationKey: 'M',
      name: 'Master',
      avatarUrl:
      ''),
  ContactVO(seationKey: 'P', name: '彭于晏', avatarUrl: ''),
  ContactVO(
      seationKey: 'P',
      name: '彭简',
      avatarUrl:
      ''),
  ContactVO(
      seationKey: 'Q',
      name: '乔大',
      avatarUrl:''),
  ContactVO(
      seationKey: 'Q',
      name: '乔小',
      avatarUrl:''),
  ContactVO(
      seationKey: 'Q',
      name: '邱小玲',
      avatarUrl:''),
  ContactVO(
      seationKey: 'Q',
      name: '齐东宇',
      avatarUrl:''),
  ContactVO(
      seationKey: 'R',
      name: 'rogerMan',
      avatarUrl:''),
  ContactVO(
      seationKey: 'S',
      name: '石头熊',
      avatarUrl:''),
  ContactVO(seationKey: 'S', name: '孙丽', avatarUrl: ''),
  ContactVO(
      seationKey: 'S',
      name: '沈家',
      avatarUrl:
      ''),
  ContactVO(
      seationKey: 'T',
      name: '天天',
      avatarUrl:''),
  ContactVO(
      seationKey: 'W',
      name: '薇薇安',
      avatarUrl:''),
  ContactVO(seationKey: 'X', name: '小猪', avatarUrl: ''),
  ContactVO(
      seationKey: 'X',
      name: '小猪佩奇',
      avatarUrl:
      ''),
  ContactVO(
      seationKey: 'X',
      name: '茜茜',
      avatarUrl:''),
  ContactVO(
      seationKey: 'Y',
      name: '杨洋',
      avatarUrl:
      ''),
  ContactVO(
      seationKey: 'Z',
      name: '张一山',
      avatarUrl:''),
];