import 'package:flutter/material.dart';
import 'package:pro/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash Demo',
      home: MySplashScreen(),
      // home: YoutubeShortsPlayer(),
    );
  }
}
