import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:driver_app/view_model/web_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutScreen extends StatelessWidget {
  LogoutScreen({super.key});

  final mainController = Get.put(MainScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPaddin),
      color: whiteColor,
      width: MediaQuery.of(context).size.width -
          mainController.sizeDrawerMenu.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Logout', style: WebAppTextStyle.headline1),
        ],
      ),
    );
  }
}
