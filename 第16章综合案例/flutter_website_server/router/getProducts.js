const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/products/";
//获取产品数据
router.post("/",urlencodedParser,(req,res) => {

    var products = {
      "code":"0",
      "message":"success",
      "data":[
        {
          productId:"001",
          "desc": "屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
          "imageUrl":base_url + "001/cover.jpg",
          "type":"新款",
          "point":"强悍",
          "name":"苹果笔记本",
        },
        {
          productId:"002",
          "desc": "外星人alienware全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
          "imageUrl":base_url + "002/cover.jpg",
          "type": "新款",
          "point":"强悍",
          "name":"外星人笔记本",
        },
        {
          productId:"003",
          "desc": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
          "imageUrl":base_url + "003/cover.jpg",
          "type":"新款",
          "name":"戴尔笔记本",
          "point":"超薄",
        },
        {
          productId:"004",
          "desc": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
          "imageUrl":base_url + "004/cover.jpg",
          "type":"新款",
          "name":"ThinkPad笔记本",
          "point":"超轻超薄",
        },
        {
          productId:"005",
          "desc": "屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
          "imageUrl":base_url + "005/cover.jpg",
          "type":"新款",
          "point":"强悍",
          "name":"苹果笔记本",
        },
        {
          productId:"006",
          "desc": "外星人alienware全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
          "imageUrl":base_url + "006/cover.jpg",
          "type": "新款",
          "point":"强悍",
          "name":"外星人笔记本",
        },
        {
          productId:"007",
          "desc": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
          "imageUrl":base_url + "007/cover.jpg",
          "type":"新款",
          "name":"戴尔笔记本",
          "point":"超薄",
        },
        {
          productId:"008",
          "desc": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
          "imageUrl":base_url + "008/cover.jpg",
          "type":"新款",
          "name":"ThinkPad笔记本",
          "point":"超轻超薄",
        },
      ]
  };

  res.send(products);



});

module.exports = router;