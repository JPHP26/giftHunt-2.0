import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gifthunterbetaversion/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/splash_screen_target.json', repeat: false),
            const Text(
              'G I F T H U N T',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'SourceSans3',
                  fontWeight: FontWeight.w800,
                  color: Color(0xff241346)),
            )
          ],
        ),
      ),
    );
  }
}
