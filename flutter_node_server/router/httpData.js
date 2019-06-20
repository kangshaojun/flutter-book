const express = require("express");
const router = express();

router.get("/",(req,res) => {
    var data = {
        "code":"0",
        "message":"success",
        "data":[
            {
                "name":"张三",
            },
            {
                "name":"李四",
            },
            {
                "name":"王五",
            },
        ]
    };

    res.send(data);

});

module.exports = router;