// ignore_for_file: unused_import

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fakestore_application/screens/homeScreen.dart';
import 'package:fakestore_application/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset(
                "assets/Lottie/Animation - 1724878991782.json"),
          ),
        ],
      ),
      duration: 4000,
      splashIconSize: 400,
      nextScreen: Homescreen(),
    );
  }
}
