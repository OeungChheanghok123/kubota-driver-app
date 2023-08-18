import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/main_screen/dashboard_mobile_screen.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileLoginScreen extends StatelessWidget {
  MobileLoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                _buildShapeBarLogo(context),
                SizedBox(height: defaultPaddin * 8.sp),
                Text(
                  'Login to your account',
                  style: MobileAppTextStyle.headline1,
                ),
                SizedBox(height: defaultPaddin * 5.sp),
                _buildTextField(
                  context,
                  controller: emailController,
                  txt: "Username",
                ),
                SizedBox(height: defaultPaddin * 3.sp),
                _buildTextField(
                  context,
                  controller: passwordController,
                  txt: "Password",
                  obscureText: true,
                ),
                _buildButtonText('Forgot Password?'),
                const Spacer(),
                _buildButtonLogin(
                  'Login',
                  onTap: () {
                    Get.offAll(
                      MobileDashboardScreen(),
                    );
                  },
                ),
              ],
            ),
          ),
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
          height: 70.5.sp,
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
            bottomRight: Radius.circular(defaultRadius * 20.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 40.sp,
        width: 40.sp,
        decoration: const BoxDecoration(
          color: primaryGrayColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(defaultPaddin * 5.sp),
          child: Image.asset("assets/images/Black_Person.png"),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    bool obscureText = false,
    required String txt,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5.sp,
      child: AppWidgets.textField(
        context,
        controller,
        hintText: txt,
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildButtonText(String txt) {
    return TextButton(
      onPressed: () {},
      child: Text(
        txt,
        style: TextStyle(
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _buildButtonLogin(
    String txt, {
    required onTap,
  }) {
    return Container(
      width: 50.sp,
      margin: EdgeInsets.only(bottom: defaultPaddin * 10.sp),
      child: AppWidgets.button(
        txt,
        leftIcon: Icons.login,
        backgroundColor: shapeColor,
        borderRadius: defaultPaddin * 5.sp,
        onTap: onTap,
      ),
    );
  }
}
