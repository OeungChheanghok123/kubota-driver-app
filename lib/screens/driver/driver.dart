import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen/main_screen_view_model.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverScreen extends StatelessWidget {
  DriverScreen({super.key});

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
          Text('Driver', style: AppTextStyle.headline1),
        ],
      ),
    );
  }
}
