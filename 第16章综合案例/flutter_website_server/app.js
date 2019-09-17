const express = require("express");
const path = require("path");
const app = express();
const http = require('http');
const ws = require('ws');

app.use(express.static(path.resolve(__dirname,"public")));

app.use(function(req,res,next){
    const proxy = req.query.proxy;
    if(proxy){
        req.header.cookie = req.header.cookie + `__proxy__${proxy}`;
    }
    next();
});

//获取数据 路由到不同的数据接口
app.use("/getProducts",require("./router/getProducts"));
app.use("/getProductDetail",require("./router/getProductDetail"));

const port = process.env.PORT || 3000;
//启动Http服务
let server = http.createServer(app).listen(port,() => {
    console.log(`server running @http://localhost:${port}`);
});
//创建WebSocket服务
let websocket = new ws.Server({server: server});

//接收客户端连接
websocket.on("connection", session => {

    console.log("connection:");

    session.on("error", error => {
        console.log("client error:" + error);
    });

    session.on("close", data => {
    });
    //前端客户端的消息
    session.on("message", message => {

        try {
            //解析消息
            message = JSON.parse(message);
            console.log("message.type::" + message.type);
        } catch (e) {
            console.log(e.message);
        }
        //根据消息类型做不同处理
        switch (message.type) {
            //加入房间
            case "joinRoom":
                console.log("message.userId:" + message.userId);
                break;
            //离开房间
            case "leaveRoom":
                break;
            //公共聊天
            case "chat_public":
                try {
                    //迭代所有Client对象发送消息
                    websocket.clients.forEach(client => {
                        client.send(JSON.stringify(message));
                    });
                }
                catch(e){
                        console.log(e.message);
                }
                break;
            default:
        }
    });
});

module.exports = app;
