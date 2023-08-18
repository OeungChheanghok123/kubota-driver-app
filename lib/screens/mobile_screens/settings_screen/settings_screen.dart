import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/mobile_app_bar.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _appBar,
      body: _bodyApp,
      bottomNavigationBar: _buildButtonBooking,
    );
  }

  AppBar get _appBar {
    return AppBar(
      elevation: 0,
      backgroundColor: whiteColor,
      excludeHeaderSemantics: true,
      toolbarHeight: 48.sp,
      flexibleSpace: const MobileAppBar(),
    );
  }

  Widget get _bodyApp {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(Get.context!).size.width,
        margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: defaultPaddin * 2.sp),
              child: Center(
                child: Text(
                  "Setting",
                  style: MobileAppTextStyle.headline1.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: defaultPaddin * 4.sp),
            Column(
              children: [
                _buildListTile(
                  iconData: Icons.people,
                  txt: "Account",
                ),
                _buildListTile(
                  iconData: Icons.dark_mode,
                  txt: "Dark Mode",
                ),
                _buildListTile(
                  iconData: Icons.password,
                  txt: "Change Password",
                ),
                _buildListTile(
                  iconData: Icons.language,
                  txt: "Change Language",
                ),
                _buildListTile(
                  iconData: Icons.feedback,
                  txt: "Feedback",
                ),
                _buildListTile(
                  iconData: Icons.question_mark,
                  txt: "About",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildButtonBooking {
    return Container(
      margin: EdgeInsets.all(defaultPaddin * 5.sp),
      child: AppWidgets.button(
        'Log out',
        backgroundColor: primaryGrayColor,
        onTap: () {},
      ),
    );
  }

  Widget _buildListTile({
    required String txt,
    required IconData iconData,
  }) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(txt),
    );
  }
}
