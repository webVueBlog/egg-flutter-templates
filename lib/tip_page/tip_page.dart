import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {
  const TipRoute({
    super.key,
    required this.text, // 接收一个text参数
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              const Text(
                "Hello world",
                textAlign: TextAlign.left,
              ),
              Text(
                "Hello world! I'm Jack. " * 2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text(
                "Hello world " * 6, //字符串重复六次
                textAlign: TextAlign.center,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://1024bibi.com",
                  style: TextStyle(color: Colors.blue),
                  recognizer: null,
                ),
              ])),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值 dada"),
                child: const Text("返回"),
              ),
              // ElevatedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
              ElevatedButton(
                child: const Text("normal"),
                onPressed: () {},
              ),
              OutlinedButton(
                child: const Text("OutlineButton"),
                onPressed: () {
                  debugPrint("outlineButton");
                },
              ),
              FloatingActionButton(
                  child: const Text("F"),
                  onPressed: () {
                    debugPrint("F");
                  }),
              const Image(
                image: NetworkImage(
                    "https://financialtribune.com/sites/default/files/field/image/17january/telegram_logo.svg_.png"),
                width: 120.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
