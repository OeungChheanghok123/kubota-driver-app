import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/mobile_app_bar.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CarBookingScreen extends StatelessWidget {
  CarBookingScreen({super.key});

  final dateStart = TextEditingController().obs;
  final dateReturn = TextEditingController().obs;

  final locationStart = TextEditingController().obs;
  final locationEnd = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        excludeHeaderSemantics: true,
        toolbarHeight: 48.sp,
        flexibleSpace: const MobileAppBar(),
      ),
      body: SingleChildScrollView(
        child: _bodyApp(context),
      ),
    );
  }

  Widget _bodyApp(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: defaultPaddin * 2.sp),
            child: Center(
              child: Text(
                "Car Booking",
                style: MobileAppTextStyle.headline1.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPaddin * 4.sp),
          _buildDateTextField(
            context,
            txt: "Departure Date",
            controller: dateStart.value,
            hintText: "Select Date",
          ),
          SizedBox(height: defaultPaddin * 4.sp),
          _buildTextField(
            txt: "Trip Location",
            controller: locationStart.value,
            hintText: "Select Location",
          ),
          SizedBox(height: defaultPaddin * 4.sp),
          _buildDateTextField(
            context,
            txt: "Reutrun Date",
            controller: dateReturn.value,
            hintText: "Select Date",
          ),
          SizedBox(height: defaultPaddin * 4.sp),
          _buildTextField(
            txt: "Last Trip Location",
            controller: locationEnd.value,
            hintText: "Select Location",
          ),
          _buildButtonLogin(
            "Request",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String txt,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: MobileAppTextStyle.headline1.copyWith(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: blackColor,
              ),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildDateTextField(
    BuildContext context, {
    required String txt,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: MobileAppTextStyle.headline1.copyWith(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: blackColor,
              ),
            ),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
            );
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              controller.text = formattedDate;
            } else {
              debugPrint("Date is not selected");
            }
          },
        ),
      ],
    );
  }

  Widget _buildButtonLogin(
    String txt, {
    required onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultPaddin * 10.sp,
      ),
      child: AppWidgets.button(
        txt,
        backgroundColor: shapeColor,
        onTap: onTap,
      ),
    );
  }
}
