import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen/main_screen_view_model.dart';
import 'package:driver_app/utility/button_app_bar.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarRequestScreen extends StatelessWidget {
  CarRequestScreen({super.key});
  final mainController = Get.put(MainScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: MediaQuery.of(context).size.width -
          mainController.sizeDrawerMenu.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar,
          const ButtonAppBar(),
        ],
      ),
    );
  }

  Widget get appBar {
    return AppBar(
      title: Text('Car Request', style: AppTextStyle.headline1),
      centerTitle: false,
      backgroundColor: whiteColor,
      elevation: 1,
    );
  }

}