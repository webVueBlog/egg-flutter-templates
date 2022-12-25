import 'package:flutter/material.dart';

import '../progress_page/progress_page.dart';
import 'widget_first.dart';

class WidgetRoute extends StatelessWidget {
  const WidgetRoute({
    super.key,
    required this.text, // 接收一个text参数
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组件1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        // 滚动
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text("跳转组件页面"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ScaffoldRoute();
                    }),
                  );
                },
              ),
              ElevatedButton(
                child: const Text("跳转进度条页面"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ProgressRoute();
                    }),
                  );
                },
              ),
              Text(text),
              Container(
                margin: const EdgeInsets.all(20.0), //容器外补白
                color: Colors.orange,
                child: const Text("Hello world!"),
              ),
              Container(
                padding: const EdgeInsets.all(20.0), //容器内补白
                color: Colors.orange,
                child: const Text("Hello world!"),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text("Hello world!"),
                ),
              ),
              const DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Hello world!"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.0, left: 120.0),
                constraints: const BoxConstraints.tightFor(
                    width: 200.0, height: 150.0), //卡片大小
                decoration: const BoxDecoration(
                  //背景装饰
                  gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98,
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                alignment: Alignment.center, //卡片内文字居中
                child: const Text(
                  //卡片文字
                  "1.10", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.0, left: 120.0),
                constraints: const BoxConstraints.tightFor(
                    width: 200.0, height: 150.0), //卡片大小
                decoration: const BoxDecoration(
                  //背景装饰
                  gradient: RadialGradient(
                    //背景径向渐变
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98,
                  ),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                    )
                  ],
                ),
                transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                alignment: Alignment.center, //卡片内文字居中
                child: const Text(
                  //卡片文字
                  "1.10", style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
