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
  int times = 60;
  late Timer timer;
  String timeView = '0:00:00';
  bool isRunning = false;

  void timeStart() {
    if (isRunning) {
      timeStop();
      setState(() {
        isRunning = !isRunning;
      });
    } else {
      setState(() {
        isRunning = !isRunning;
      });
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        //Timer.주기 Duration = 시간 명령어
        setState(() {
          timeView = Duration(seconds: times).toString().split('.').first;
          times--;
          if (times < 0) {
            timeStop();
            isRunning = !isRunning;
          }
        });
      });
    }
  }

  void timeStop() {
    timer.cancel();
  }

  void tiemReset() {
    setState(() {
      if (timer == null) timeStop();
      isRunning = false;
      timeStop();
      times = 60;
      timeView = Duration(seconds: times).toString().split('.').first;
    });
  }

  void addTime(int sec) {
    times += sec;
    times = times < 0 ? 0 : times;
    setState(() {
      timeView = Duration(seconds: times).toString().split('.').first;
    });
  }

  @override
  Widget build(BuildContext context) {
    timeView = Duration(seconds: times).toString().split('.').first;
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
              flex: 1,
              child: Container(
                color: Colors.cyan,
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    timeButton(sec: 60, color: Colors.cyan),
                    timeButton(
                        sec: 30, color: const Color.fromARGB(255, 0, 119, 134)),
                    timeButton(
                        sec: -60, color: const Color.fromARGB(255, 0, 71, 80)),
                    timeButton(
                        sec: -30, color: const Color.fromARGB(255, 0, 47, 53)),
                  ],
                ),
              )),
          Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    timeView,
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
                      if (isRunning)
                        IconButton(
                          onPressed: timeStart,
                          icon: const Icon(Icons.pause_circle_rounded),
                          iconSize: 50,
                        )
                      else if (!isRunning)
                        IconButton(
                          onPressed: timeStart,
                          icon: const Icon(Icons.play_circle_rounded),
                          iconSize: 50,
                        ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: tiemReset,
                        icon: const Icon(Icons.restore_rounded),
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

  GestureDetector timeButton({required int sec, required Color color}) {
    return GestureDetector(
      onTap: () => addTime(sec),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Center(child: Text('$sec')),
      ),
    );
  }
}
