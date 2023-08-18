import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/main_screen/get_start_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileSplashScreen extends StatelessWidget {
  const MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: _buildLogoKBC,
        nextScreen: GetStartScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: whiteColor,
      ),
    );
  }

  Widget get _buildLogoKBC {
    return SizedBox(
      height:55.sp,
      width: 55.sp,
      child: Image.asset('assets/images/kbc-logo.png'),
    );
  }
}
