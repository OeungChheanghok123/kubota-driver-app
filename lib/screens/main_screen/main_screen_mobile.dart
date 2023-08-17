import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/login/mobile_login_screen.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreenMobile extends StatelessWidget {
  MainScreenMobile({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          _buildShapeBarLogo(context),
          _buildCompanyName,
          _buildButtonStart,
        ],
      ),
    );
  }

  Widget _buildShapeBarLogo(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 72.5.sp,
        ),
        _buildShapeAppBar(context),
        _buildLogo(context),
      ],
    );
  }

  Widget _buildShapeAppBar(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65.sp,
        decoration: BoxDecoration(
          color: shapeColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultRadius * 20.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 50.sp,
        width: 50.sp,
        decoration: const BoxDecoration(
          color: primaryGrayColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/Logo.png'),
          ),
        ),
      ),
    );
  }

  Widget get _buildCompanyName {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Kubota Leasing (Cambodia) PLC.",
              style: MobileAppTextStyle.headline1,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _buildButtonStart {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(bottom: defaultPaddin * 10.sp),
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(
              MobileLoginScreen(),
              transition: Transition.fadeIn,
            );
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultPaddin * 5.sp),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(defaultPaddin.sp),
            child: Text(
              "Getting Started",
              style: MobileAppTextStyle.headline1.copyWith(
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
