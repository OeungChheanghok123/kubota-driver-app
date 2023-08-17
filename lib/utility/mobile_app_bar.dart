import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildShapeBarLogo(context);
  }

  Widget _buildShapeBarLogo(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildShapeAppBar(context),
        _buildLogo(context),
        _buildUserAndRole(context),
        _buildNotification(context),
      ],
    );
  }

  Widget _buildShapeAppBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55.sp,
      decoration: BoxDecoration(
        color: shapeColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(defaultRadius * 16.sp),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Container(
        height: 35.sp,
        width: 35.sp,
        decoration: const BoxDecoration(
          color: primaryGrayColor,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(defaultPaddin * 4.sp),
          child: Image.asset("assets/images/Black_Person.png"),
        ),
      ),
    );
  }

  Widget _buildUserAndRole(BuildContext context) {
    return Positioned(
      top: 30.sp,
      left: 20.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mr. Po Chanrith",
            style: MobileAppTextStyle.headline1.copyWith(color: whiteColor),
          ),
          Text(
            "IT Officer",
            style: MobileAppTextStyle.headline1.copyWith(color: whiteColor),
          ),
        ],
      ),
    );
  }

  Widget _buildNotification(BuildContext context) {
    return Positioned(
      right: 15.sp,
      top: 30.sp,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_active,
          color: whiteColor,
          size: 24.sp,
        ),
      ),
    );
  }

}