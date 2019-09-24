const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/goods/";


router.post("/",urlencodedParser,(req,res) => {

    //get请求参数读取
    //const shopId = req.query.shopId;
    //console.log(shopId);
    //post请求参数读取
    var shopId = req.body.shopId;
    console.log(shopId);

    var goods = {
        "code":"0",
        "message":"success",
        "data":[
            {
                "name": "苹果 屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
                "image": base_url + "001/cover.jpg",
                "presentPrice": 13999,
                "goodsId": "001",
                "oriPrice": 15999
            }, {
                "name": "外星人alienware 全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
                "image": base_url + "002/cover.jpg",
                "presentPrice": 19999,
                "goodsId": "002",
                "oriPrice": 23999
            }, {
                "name": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
                "image": base_url + "003/cover.jpg",
                "presentPrice": 6600,
                "goodsId": "003",
                "oriPrice": 8999
            }, {
                "name": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
                "image": base_url + "004/cover.jpg",
                "presentPrice": 5699,
                "goodsId": "004",
                "oriPrice": 7800
            }, {
                "name": "苹果 屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
                "image": base_url + "005/cover.jpg",
                "presentPrice": 13999,
                "goodsId": "005",
                "oriPrice": 15999
            }, {
                "name": "外星人alienware 全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
                "image": base_url + "006/cover.jpg",
                "presentPrice": 19999,
                "goodsId": "006",
                "oriPrice": 23999
            }, 
            {
                "name": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
                "image": base_url + "007/cover.jpg",
                "presentPrice": 6600,
                "goodsId": "007",
                "oriPrice": 8999
            }, {
                "name": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
                "image": base_url + "008/cover.jpg",
                "presentPrice": 5699,
                "goodsId": "008",
                "oriPrice": 7800
            },
        ]
    };

    res.send(goods);

});

module.exports = router;