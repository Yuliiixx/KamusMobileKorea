import 'package:flutter/material.dart';
import 'package:mobile_kamus/splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamus Mobile',
      home: SplashScreen(),
      routes: {
        '/home': (context) => SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}