import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/web_screens/driver/driver_data_table.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/view_model/mobile_view_model/driver_view_model.dart';
import 'package:driver_app/view_model/web_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriverViewScreen extends StatelessWidget {
  DriverViewScreen({super.key});

  final mainController = Get.put(MainScreenViewModel());
  final controller = Get.put(DriverViewModel());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: whiteColor,
        width: width - mainController.sizeDrawerMenu.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.appTitle(
              context,
              title: "Driver / View Driver",
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: defaultPaddin * 2,
                vertical: defaultPaddin,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: blackColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultPaddin),
                    width: width,
                    color: blackColor.withOpacity(0.2),
                    child: Text(
                      "View Driver",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DriverDatableWidget(
                    controller: controller.searchDriverViewController.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
