import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        size: 20,
      ),
      trailing: trailing
          ? const Icon(Icons.arrow_forward_ios, color: primaryColor)
          : Icon(iconData, color: secondGraydColor),
      title: Text(
        title,
        style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
      ),
      onTap: onTap,
    );
  }

  static Widget textField(
    BuildContext context,
    TextEditingController controller, {
    bool suffixIcon = false,
    TextInputType textInputType = TextInputType.text,
    IconData? iconData,
    String? suffixText,
    String? hintText,
    bool obscureText = false,
  }) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      style: WebAppTextStyle.title1,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: WebAppTextStyle.title1.copyWith(
          color: secondGraydColor,
          fontSize: 14.sp,
        ),
        suffixIcon: suffixIcon
            ? Container(
                width: 100,
                padding: const EdgeInsets.only(right: defaultPaddin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      iconData,
                      color: primaryColor,
                    ),
                    const SizedBox(width: defaultPaddin / 2),
                    Text(
                      "$suffixText",
                      style:
                          WebAppTextStyle.title2.copyWith(color: primaryColor),
                    ),
                  ],
                ),
              )
            : const Icon(
                Icons.percent,
                color: whiteColor,
              ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: defaultPaddin * 1.5,
          vertical: defaultPaddin,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondGraydColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(defaultPaddin / 2)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondGraydColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(defaultPaddin / 2)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor, width: 2.0),
        ),
      ),
      onSubmitted: (val) {},
      onChanged: (String val) {},
    );
  }

  static Widget button(
    String text, {
    required VoidCallback onTap,
    Color backgroundColor = primaryColor,
    IconData? leftIcon,
    IconData? rightIcon,
    Color color = whiteColor,
    double borderRadius = 13,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultPaddin),
        margin: const EdgeInsets.symmetric(vertical: defaultPaddin / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftIcon != null)
              Icon(
                leftIcon,
                color: color,
                size: 18.sp,
              ),
            if (leftIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            Text(
              text,
              style: WebAppTextStyle.headline1.copyWith(
                color: whiteColor,
                fontSize: 16.sp,
              ),
            ),
            if (rightIcon != null)
              const SizedBox(
                width: defaultPaddin,
              ),
            if (rightIcon != null)
              Icon(
                rightIcon,
                color: color,
              ),
          ],
        ),
      ),
    );
  }

  static Widget appTitle(
    BuildContext context, {
    required String title,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(defaultPaddin * 2),
      color: blackColor.withOpacity(0.3),
      child: Text(
        title,
        style: WebAppTextStyle.headline1.copyWith(
          color: whiteColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  static Widget underLine({
    required double width,
    required double height,
    var color = secondColor,
  }) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
