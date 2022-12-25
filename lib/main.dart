import 'package:flutter/material.dart';
import './start_page/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 应用名称
      // title: ' APP',
      // theme: ThemeData(
      // 应用主题
      //   primarySwatch: Colors.blue,
      // ),
      debugShowCheckedModeBanner: false,
      // 应用首页路由
      home: StartUpPage(title: '我的APP'),
    );
  }
}
