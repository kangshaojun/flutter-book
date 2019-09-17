const express = require("express");
const router = express();
const config = require("./config");
var bodyParser = require('body-parser');
// 创建 application/x-www-form-urlencoded 编码解析
var urlencodedParser = bodyParser.urlencoded({extended:false});
const base_url = "http://" + config.IP + ":" + config.PORT + "/images/products/";
//获取产品详情数据
router.post("/",urlencodedParser,(req,res) => {
    var productId = req.body.productId;
    console.log(productId);

    //产品详情
    var detail_001 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "001",
			"desc": "屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
			"imageUrl":base_url + "001/cover.jpg",
			"type":"新款",
			"name":"苹果笔记本",
			"point":"强悍",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '001/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '001/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '001/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '001/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '001/5.jpg" />'
		}
	};

	var detail_002 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "002",
			"desc": "外星人alienware全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
			"imageUrl":base_url + "002/cover.jpg",
			"type":"新款",
			"name":"外星人笔记本",
			"point":"强悍",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '002/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '002/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '002/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '002/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '002/5.jpg" />'
		}
	};

	var detail_003 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "003",
			"desc": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
			"imageUrl":base_url + "003/cover.jpg",
			"type":"新款",
			"name":"戴尔笔记本",
			"point":"超薄",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '003/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '003/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '003/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '003/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '003/5.jpg" />'
		}
	};

	var detail_004 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "004",
			"desc": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
			"imageUrl":base_url + "004/cover.jpg",
			"type":"新款",
			"name":"ThinkPad笔记本",
			"point":"超轻超薄",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '004/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '004/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '004/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '004/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '004/5.jpg" />'
		}
	};

	var detail_005 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "005",
			"desc": "屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259",
			"imageUrl":base_url + "005/cover.jpg",
			"type":"新款",
			"name":"苹果笔记本",
			"point":"强悍",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '005/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '005/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '005/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '005/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '005/5.jpg" />'
		}
	};

	var detail_006 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "006",
			"desc": "外星人alienware全新m15 R2九代酷睿i7六核GTX1660Ti独显144Hz吃鸡游戏笔记本电脑戴尔DELL15M-R4725",
			"imageUrl":base_url + "006/cover.jpg",
			"type":"新款",
			"name":"外星人笔记本",
			"point":"强悍",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '006/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '006/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '006/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '006/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '006/5.jpg" />'
		}
	};

	var detail_007 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "007",
			"desc": "Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑",
			"imageUrl":base_url + "007/cover.jpg",
			"type":"新款",
			"name":"戴尔笔记本",
			"point":"超薄",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '007/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '007/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '007/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '007/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '007/5.jpg" />'
		}
	};

	var detail_008 = {
		"code": "0",
		"message": "success",
		"data": {
			"productId": "008",
			"desc": "联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品IBM全新办公用 商务大学生手提笔记本电脑E470新款",
			"imageUrl":base_url + "008/cover.jpg",
			"type":"新款",
			"name":"ThinkPad笔记本",
			"point":"超轻超薄",
			"productDetail": '<img width="100%" height="auto" alt="" src="' + base_url + '008/1.jpg" />' + 
			'<img width="100%" height="auto" alt="" src="' + base_url + '008/2.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '008/3.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '008/4.jpg" />' +
			'<img width="100%" height="auto" alt="" src="' + base_url + '008/5.jpg" />'
		}
	};
    
    var productDetail = detail_001;
    if(productId == '001'){
        productDetail = detail_001;
    }else if(productId == '002'){
        productDetail = detail_002
    }else if(productId == '003'){
        productDetail = detail_003
    }else if(productId == '004'){
        productDetail = detail_004
    }else if(productId == '005'){
        productDetail = detail_005
    }else if(productId == '006'){
        productDetail = detail_006
    }else if(productId == '007'){
        productDetail = detail_007
    }else if(productId == '008'){
        productDetail = detail_008
    }
    res.send(productDetail);

});

module.exports = router;