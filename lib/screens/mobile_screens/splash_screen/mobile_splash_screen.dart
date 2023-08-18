import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/main_screen/get_start_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileSplashScreen extends StatelessWidget {
  const MobileSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1500,
        splash: _buildSplashLogo,
        nextScreen: GetStartScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: whiteColor,
      ),
    );
  }

  Widget get _buildSplashLogo {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 6.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo('assets/images/kbc-logo.png', 50),
          _buildLogo('assets/images/Logo.png', 45),
        ],
      ),
    );
  }

  Widget _buildLogo(String txt, int size) {
    return SizedBox(
      height: size.sp,
      width: size.sp,
      child: Image.asset(txt),
    );
  }
}
