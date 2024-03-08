import 'package:flutter/material.dart';
import 'package:mobile_kamus/splashscreen.dart';
import 'package:mobile_kamus/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => SplashScreen(),
      },
    );
  }
}
