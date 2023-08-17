import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  final mainController = Get.put(MainScreenViewModel());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: whiteColor,
      width: width - mainController.sizeDrawerMenu.value,
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
      title: Text('Bookings', style: WebAppTextStyle.headline1),
      centerTitle: false,
      backgroundColor: whiteColor,
      elevation: 1,
    );
  }

  Widget buttonAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
        color: primaryGrayColor,
        border: Border(
          top: BorderSide(width: 1, color: primaryGrayColor),
          bottom: BorderSide(width: 1, color: primaryGrayColor),
        ),
      ),
      child: Row(
        children: [
          _buildButtonText(
            iconData: Icons.feed,
            txt: "New",
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          _buildButtonText(
            iconData: Icons.edit_note,
            txt: "Edit",
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          _buildButtonText(
            iconData: Icons.restore,
            txt: "Cancel",
            onPressed: () {},
          ),
          const SizedBox(width: defaultPaddin),
          _buildTextField(
            width: 200,
            height: 30,
            controller: mainController.searchController,
            hintText: "Record ID",
          ),
          const SizedBox(width: defaultPaddin),
        ],
      ),
    );
  }

  Widget _buildButtonText({
    required IconData iconData,
    required String txt,
    required onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: secondColor),
          const SizedBox(width: 3),
          Text(txt, style: WebAppTextStyle.headline2),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required double width,
    required double height,
    required String hintText,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: 200,
      height: 30,
      child: TextField(
        style: WebAppTextStyle.headline2,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          hintStyle: WebAppTextStyle.headline2.copyWith(
            color: secondGraydColor,
          ),
          contentPadding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 0,
          ),
        ),
      ),
    );
  }

  Widget dropDownMenuButton() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: Colors.blueAccent,
      ),
      validator: (value) => value == null ? "Select a country" : null,
      dropdownColor: Colors.blueAccent,
      value: mainController.dropDownSelectedItem.value,
      onChanged: (newValue) {
        mainController.dropDownSelectedItem.value = newValue!;
      },
      items: <String>['A', 'B', 'C', 'D'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
