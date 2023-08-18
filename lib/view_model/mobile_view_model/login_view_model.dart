import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/main_screen/dashboard_mobile_screen.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final String _email = "admin@kubota.com";
  final String _password = "123";

  void buttonLogin(BuildContext context) {
    if (emailController.value.text == _email &&
        passwordController.value.text == _password) {
      Get.offAll(MobileDashboardScreen());
    } else {
      emailController.value.text = "";
      passwordController.value.text = "";

      _showAlertDialog(context);
    }
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 25.sp,
            child: Center(
              child: Text(
                'Username/Password is incorrect',
                style: MobileAppTextStyle.headline1.copyWith(
                  color: redColor,
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text(
                  'OK',
                  style: MobileAppTextStyle.headline1.copyWith(
                    color: blackColor,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
