import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen/main_screen_view_model.dart';
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
          buttonAppBar(context),
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

  Widget buttonAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        color: whiteColor,
        border: Border(
          top: BorderSide(width: 1, color: primaryGrayColor),
          bottom: BorderSide(width: 1, color: primaryGrayColor),
        ),
      ),
      child: Row(
        children: [
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.feed,
                  color: blackColor,
                ),
                const SizedBox(width: 3),
                Text("Save", style: AppTextStyle.headline2),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.edit_note,
                  color: blackColor,
                ),
                const SizedBox(width: 3),
                Text("Edit", style: AppTextStyle.headline2),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          TextButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.restore,
                  color: blackColor,
                ),
                const SizedBox(width: 3),
                Text("Cancel", style: AppTextStyle.headline2),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              style: AppTextStyle.headline2,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Record ID',
                hintStyle:
                    AppTextStyle.headline2.copyWith(color: secondGraydColor),
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  top: 0,
                  bottom: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
