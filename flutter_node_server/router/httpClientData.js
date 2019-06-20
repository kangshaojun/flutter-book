const express = require("express");
const router = express();

router.get("/",(req,res) => {
    var data = {
        "code":"0",
        "message":"success",
        "data":[
            {
                "name":"张三",
                "sex":"男",
                "age":"20",
            },
            {
                "name":"李四",
                "sex":"男",
                "age":"30",
            },
            {
                "name":"王五",
                "sex":"男",
                "age":"28",
            },
        ]
    };

    res.send(data);

});

module.exports = router;