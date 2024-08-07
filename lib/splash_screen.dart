import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pro/homepage.dart';
import 'package:timer_count_down/timer_count_down.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset('assets/images/bg.png'),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset('assets/images/couple.gif'),
            ),
            const SizedBox(
              height: 200.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60.0,
                  child: Center(
                    child: Text(
                      "redirecting to HomePage in: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                Countdown(
                  seconds: 4,
                  build: (BuildContext context, double time) =>
                      Text(time.toString()),
                  // interval: const Duration(milliseconds: 300),
                  onFinished: () {
                    log('Timer Completed!');
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
