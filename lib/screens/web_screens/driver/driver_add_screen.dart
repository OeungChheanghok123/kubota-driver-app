import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/view_model/mobile_view_model/driver_view_model.dart';
import 'package:driver_app/view_model/web_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriverAddScreen extends StatelessWidget {
  DriverAddScreen({super.key});

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
              title: "Driver / Add Driver",
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
                      children: [
                        Text(
                          "Add Driver",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(defaultPaddin / 2),
                          margin: const EdgeInsets.only(right: defaultPaddin),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPaddin / 2),
                          margin: const EdgeInsets.only(right: defaultPaddin),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(defaultRadius),
                          ),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(defaultPaddin),
                    margin: const EdgeInsets.only(
                      left: defaultPaddin,
                      right: defaultPaddin * 2,
                    ),
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textFieldWidget(
                          context,
                          controller: controller.firstName.value,
                          txt: "First Name",
                        ),
                        textFieldWidget(
                          context,
                          controller: controller.lastName.value,
                          txt: "Last Name",
                        ),
                        textFieldWidget(
                          context,
                          controller: controller.contact.value,
                          txt: "Contact",
                          textInputType: TextInputType.number,
                        ),
                        textFieldWidget(
                          context,
                          controller: controller.address.value,
                          txt: "Address",
                        ),
                        textFieldWidget(
                          context,
                          controller: controller.emailAddress.value,
                          txt: "Email Address",
                          textInputType: TextInputType.emailAddress,
                        ),
                        textFieldWidget(
                          context,
                          controller: controller.password.value,
                          txt: "Password",
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldWidget(
    BuildContext context, {
    required controller,
    required txt,
    textInputType = TextInputType.text,
    obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        AppWidgets.textField(
          context,
          controller,
          textInputType: textInputType,
          obscureText: obscureText,
        ),
        const SizedBox(height: defaultPaddin),
      ],
    );
  }
}
