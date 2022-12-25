import 'package:flutter/material.dart';

import 'my_drawer.dart';
import 'widget_page.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(18),
          // 滚动
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            ElevatedButton(
              child: const Text("返回组件1"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const WidgetRoute(
                      text: '从主页返回',
                    );
                  }),
                );
              },
            ),
            Scrollbar(
              // 显示进度条
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    //动态创建一个List<Widget>
                    children: str
                        .split("")
                        //每一个字母都用一个Text显示,字体为原来的两倍
                        .map((c) => Text(
                              c,
                              textScaleFactor: 2.0,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ]))),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        // shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                debugPrint("首页");
              },
            ),
            // const SizedBox(), //中间位置空出
            IconButton(
              icon: const Icon(Icons.school),
              onPressed: () {
                debugPrint("校园");
              },
            ),
            IconButton(
              icon: const Icon(Icons.business),
              onPressed: () {
                debugPrint("商城");
              },
            ),
          ], //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          onPressed: _onAdd, //悬浮按钮
          child: const Icon(Icons.add)),
    );
  }

  void _onAdd() {}
}
