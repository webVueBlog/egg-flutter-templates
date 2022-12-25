import 'package:flutter/material.dart';

import '../home_page/home_page.dart';

class StartUpPage extends StatefulWidget {
  const StartUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  late bool _counter = true;

  void _incrementCounter() {
    setState(() {
      _counter = !_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _counter
          ? const Color.fromARGB(0, 0, 0, 1)
          : const Color.fromARGB(255, 255, 255, 255),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 50,
                    color: _counter ? Colors.black : Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: (() {
                        _incrementCounter();
                      }),
                      icon: Icon(
                        _counter ? Icons.sunny : Icons.nightlife_rounded,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://financialtribune.com/sites/default/files/field/image/17january/telegram_logo.svg_.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Telegram',
                    style: TextStyle(
                      fontSize: 32,
                      color: _counter
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      '世界上最快的聊天工具',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Text(
                    '免费又安全',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue,
              margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 80),
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const NewRoute();
                    }),
                  );
                },
                child: const Text("开始聊天"),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
