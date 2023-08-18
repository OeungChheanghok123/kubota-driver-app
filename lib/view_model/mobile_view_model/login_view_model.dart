import 'package:driver_app/screens/mobile_screens/main_screen/dashboard_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final String _email = "admin@kubota.com";
  final String _password = "123";

  void buttonLogin() {
    if (emailController.value.text == _email &&
        passwordController.value.text == _password) {
      Get.offAll(
        MobileDashboardScreen(),
      );
    }
  }
}
