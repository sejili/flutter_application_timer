import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int times = 1 * 60;
  late Timer timer;

  void timeStart() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        print(times--);
      });
    });
  }

  void timeStop() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'My timer',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              )),
          Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    '$times',
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 1, 40, 71),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: timeStart,
                        icon: const Icon(Icons.play_arrow_rounded),
                        iconSize: 50,
                      ),
                      const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.play_circle_rounded),
                        iconSize: 50,
                      )
                    ],
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
