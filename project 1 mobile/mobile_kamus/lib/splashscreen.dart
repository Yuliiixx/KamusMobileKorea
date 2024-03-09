import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_kamus/page_listdata.dart';

import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
          seconds: 5), // Ganti sesuai kebutuhan dengan durasi splash screen
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigator.pushReplacementNamed(context, '/home');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/a.jpeg'), // Ganti dengan path gambar Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}