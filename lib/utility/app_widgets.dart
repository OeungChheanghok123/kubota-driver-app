import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  static Widget listTile({
    bool trailing = true,
    IconData? iconData,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
        size: 24,
      ),
      trailing: trailing
          ? const Icon(Icons.arrow_forward_ios, color: primaryColor)
          : Icon(iconData, color: secondGraydColor),
      title: Text(
        title,
        style: AppTextStyle.headline2.copyWith(color: whiteColor),
      ),
      onTap: onTap,
    );
  }
}
