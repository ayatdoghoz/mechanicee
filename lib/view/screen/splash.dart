import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mechanice/constant/constant.dart';
import 'package:mechanice/view/screen/selectmethodpage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: blackColor,
      splash: Text(
        'ميكانيكي',
        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
      ),
      nextScreen: const SelectMethodePage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
