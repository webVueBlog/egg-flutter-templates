import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({super.key});

  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("登录"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: _unameController,
                  decoration: const InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v!.trim().isNotEmpty ? null : "用户名不能为空";
                  },
                  onChanged: (v) {
                    debugPrint("onChange: $v");
                  }),
              TextFormField(
                  controller: _pwdController,
                  decoration: const InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v!.trim().length > 5 ? null : "密码不能少于6位";
                  },
                  onChanged: (v) {
                    debugPrint("onChange: $v");
                  }),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("登录"),
                        ),
                        onPressed: () {
                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((_formKey.currentState as FormState).validate()) {
                            //验证通过提交数据
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const FormTestRoute();
                              }),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
