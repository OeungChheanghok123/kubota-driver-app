import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/driver_model.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/screens/driver/driver_data_table.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriverManageScreen extends StatelessWidget {
  DriverManageScreen({super.key});

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
              title: "Driver / Manage Driver",
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Manage Driver",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(defaultPaddin / 2),
                              margin:
                                  const EdgeInsets.only(right: defaultPaddin),
                              decoration: BoxDecoration(
                                color: redColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                              ),
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(defaultPaddin / 2),
                              margin:
                                  const EdgeInsets.only(right: defaultPaddin),
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                              ),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DriverDatableWidget(
                    controller: controller.searchDriverManageController.value,
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
