const express = require("express");
const path = require("path");
const app = express();

app.use(express.static(path.resolve(__dirname,"public")));

app.use(function(req,res,next){
    const proxy = req.query.proxy;
    if(proxy){
        req.header.cookie = req.header.cookie + `__proxy__${proxy}`;
    }
    next();
});

//获取数据 路由到不同的数据接口
app.use("/getHttpData",require("./router/httpData"));
app.use("/getHttpClientData",require("./router/httpClientData"));
app.use("/getDioData",require("./router/dioData"));

const port = process.env.PORT || 3000;
app.listen(port,()=>{
    console.log(`server running @http://localhost:${port}`);
});

module.exports = app;
