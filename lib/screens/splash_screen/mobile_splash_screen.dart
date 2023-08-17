import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen/main_screen_mobile.dart';
import 'package:flutter/material.dart';

class MobileSplashScreen extends StatelessWidget {
  const MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: "assets/images/Logo.png",
        nextScreen: MainScreenMobile(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: whiteColor,
      ),
    );
  }
}
