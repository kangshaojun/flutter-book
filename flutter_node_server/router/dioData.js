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
                "name": "法国代购新款江疏影同款翻领修身中长裙春夏印花连衣裙",
                "image": base_url + "001/cover.jpg",
                "presentPrice": 98.88,
                "goodsId": "001",
                "oriPrice": 108.88
            }, {
                "name": "柔美而精致~高贵而优雅~圆领金银丝春季毛衣羊毛开衫女短款白外套",
                "image": base_url + "002/cover.jpg",
                "presentPrice": 229.90,
                "goodsId": "002",
                "oriPrice": 320.99
            }, {
                "name": "明星同款高端西服2019春装新款韩版英伦风短款格子小西装女外套潮",
                "image": base_url + "003/cover.jpg",
                "presentPrice": 318.88,
                "goodsId": "003",
                "oriPrice": 388.88
            }, {
                "name": "复古廓形机车进口绵羊皮衣真皮外套女E142",
                "image": base_url + "004/cover.jpg",
                "presentPrice": 238.99,
                "goodsId": "004",
                "oriPrice": 248.99
            }, {
                "name": "单排扣高腰牛仔裤女春夏薄款紧身弹力小脚裤显瘦百搭网红浅色长裤",
                "image": base_url + "005/cover.jpg",
                "presentPrice": 588.99,
                "goodsId": "005",
                "oriPrice": 888.88
            }, {
                "name": "MIUCO女装夏季重工星星烫钻圆领短袖宽松显瘦百搭T恤上衣k",
                "image": base_url + "006/cover.jpg",
                "presentPrice": 1028.88,
                "goodsId": "006",
                "oriPrice": 1888.88
            }, 
            {
                "name": "春夏一步裙包臀裙开叉弹力修身显瘦短裙黑色高腰职业半身裙",
                "image": base_url + "007/cover.jpg",
                "presentPrice": 2388.66,
                "goodsId": "007",
                "oriPrice": 2888.88
            }, {
                "name": "夏季新款短袖圆领紧身小黑超短裙开叉包臀性感连衣裙夜店女装",
                "image": base_url + "008/cover.jpg",
                "presentPrice": 666.88,
                "goodsId": "008",
                "oriPrice": 888.88
            },
        ]
    };

    res.send(goods);

});

module.exports = router;