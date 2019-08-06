import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //全局Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  //用户名
  String userName;
  //密码
  String password;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;

    //验证Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form表单示例'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              //添加内边距
              padding: const EdgeInsets.all(16.0),
              //添加Form表单
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    //文本输入框表单组件
                    TextFormField(
                      //装饰器
                      decoration: InputDecoration(
                        //提示文本
                        labelText: '请输入用户名',
                      ),
                      //接收输入值
                      onSaved: (value) {
                        userName = value;
                      },
                      onFieldSubmitted: (value){},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单方法
                      validator: (value) {
                        return value.length < 6 ? "密码长度不够6位" : null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
            //限定容器大小
            SizedBox(
              width: 340.0,
              height: 42.0,
              //添加登录按钮
              child: RaisedButton(
                onPressed: login,
                child: Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
