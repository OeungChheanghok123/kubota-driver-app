import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/login_screen/mobile_login_screen.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartScreen extends StatelessWidget {
  GetStartScreen({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          _buildShapeBarLogo,
          _buildLogoAndCompanyName,
          _buildButtonStart,
        ],
      ),
    );
  }

  Widget get _buildShapeBarLogo {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(Get.context!).size.width,
          height: 72.5.sp,
        ),
        _buildShapeAppBar(Get.context!),
      ],
    );
  }

  Widget get _buildLogoAndCompanyName {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 6.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50.sp,
                  height: 50.sp,
                  child: Image.asset("assets/images/kbc-logo.png"),
                ),
                SizedBox(
                  width: 45.sp,
                  height: 45.sp,
                  child: Image.asset("assets/images/Logo.png"),
                ),
              ],
            ),
          ),
          Text(
            "Kubota Leasing (Cambodia) PLC.",
            style: MobileAppTextStyle.headline1,
          ),
        ],
      ),
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
}
