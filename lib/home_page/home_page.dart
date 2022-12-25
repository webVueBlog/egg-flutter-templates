import 'package:flutter/material.dart';
import '../login_page/login_page.dart';
import '../progress_page/progress_page.dart';
import '../tip_page/tip_page.dart';
import '../widget/random_words.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var icons = "";
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";

    return Scaffold(
      appBar: AppBar(
        title: const Text("提示页传参"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              const RandomWordsWidget(),

              // 模糊进度条(会执行一个旋转动画)
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
              //进度条显示50%，会显示一个半圆
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              // 模糊进度条(会执行一个动画)
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
              ),
              //进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
              Text(
                icons,
                style: const TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              // TextButton即文本按钮，默认背景透明并不带阴影。
              TextButton(
                child: const Text("normal"),
                onPressed: () {},
              ),
              // IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {},
              ),
              // ElevatedButton、TextButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(Icons.info),
                label: const Text("详情"),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () async {
                  // 打开`TipRoute`，并等待返回结果
                  var result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TipRoute(
                          // 路由参数
                          text: "我是提示 路由传值 dada",
                        );
                      },
                    ),
                  );
                  //输出`TipRoute`路由返回结果
                  debugPrint("路由返回值: $result");
                },
                child: const Text("打开提示页"),
              ),
              // OutlinedButton 默认有一个边框，不带阴影且背景透明。
              OutlinedButton(
                child: const Text("跳转进度条"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ProgressRoute();
                    }),
                  );
                },
              ),
              OutlinedButton(
                child: const Text("跳转登录页面"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const FormTestRoute();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
