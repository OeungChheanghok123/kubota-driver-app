import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  static Widget listTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: primaryColor,
        size: 16,
      ),
      trailing: const Icon(
        Icons.navigate_next_rounded,
        color: primaryColor,
      ),
      title: Text(
        title,
        style: AppTextStyle.headline2.copyWith(color: whiteColor),
      ),
      onTap: onTap,
    );
  }
}
