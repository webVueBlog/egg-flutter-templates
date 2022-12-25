import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widget/widget_page.dart';

class ProgressRoute extends StatefulWidget {
  const ProgressRoute({super.key});

  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("进度条"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: <Widget>[
              //变换
              Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                  transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Apartment for rent!'),
                  ),
                ),
              ),
              // 平移
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: const Offset(-20.0, -5.0),
                  child: const Text("Hello world"),
                ),
              ),
              // 装饰容器
              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange.shade700]), //背景渐变
                      borderRadius: BorderRadius.circular(3.0), //3像素圆角
                      boxShadow: const [
                        //阴影
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text(
                      "组件",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              // 缩放
              DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                      scale: 1.5, //放大到1.5倍
                      child: const Text("Hello world"))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                          scale: 1.5, child: const Text("Hello world"))),
                  const Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  )
                ],
              ),
              // 填充
              Padding(
                //上下左右各添加16像素补白
                padding: const EdgeInsets.all(16),
                child: Column(
                  //显式指定对齐方式为左对齐，排除对齐干扰
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Padding(
                      //左边添加8像素补白
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Hello world"),
                    ),
                    Padding(
                      //上下各添加8像素补白
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("I am Jack"),
                    ),
                    Padding(
                      // 分别指定四个方向的补白
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Text("Your friend"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    //将Transform.rotate换成RotatedBox
                    child: RotatedBox(
                      quarterTurns: 1, //旋转90度(1/4圈)
                      child: Text("Hello world"),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(_animationController), // 从灰色变成蓝色
                  value: _animationController.value,
                ),
              ),
              Switch(
                value: _switchSelected, //当前状态
                onChanged: (value) {
                  //重新构建页面
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                },
              ),
              // 旋转
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  //旋转90度
                  angle: math.pi / 4,
                  child: const Text("Hello world"),
                ),
              ),
              OutlinedButton(
                child: const Text("跳转组件页面"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const WidgetRoute(text: '哪吒',);
                    }),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
