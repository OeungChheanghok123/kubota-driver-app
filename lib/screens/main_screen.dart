import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen_view_model.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(MainScreenViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      body: _body(context),
    );
  }

  AppBar get _appBar {
    return AppBar(
      backgroundColor: primaryGrayColor,
      elevation: 0,
      centerTitle: false,
      leading: InkWell(
        splashColor: noneColor,
        hoverColor: noneColor,
        highlightColor: noneColor,
        onTap: () {
          controller.isDrawMenu.value = !controller.isDrawMenu.value;
          if (controller.isDrawMenu.value == false) {
            controller.sizeDrawerMenu.value = 0.0;
          } else {
            controller.sizeDrawerMenu.value = 250.0;
          }
        },
        child: Obx(
          () => controller.isDrawMenu.value == true
              ? Row(
                  children: const [
                    SizedBox(width: defaultPaddin / 2),
                    Icon(Icons.arrow_left, color: blackColor, size: 16),
                    Icon(Icons.menu, color: blackColor, size: 24),
                  ],
                )
              : Row(
                  children: const [
                    SizedBox(width: defaultPaddin / 2),
                    Icon(Icons.menu, color: blackColor, size: 24),
                    Icon(Icons.arrow_right, color: blackColor, size: 16),
                  ],
                ),
        ),
      ),
      title: Text('Driver App', style: AppTextStyle.headline2),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => controller.isDrawMenu.value == true
              ? _drawerMenu(context)
              : const SizedBox.shrink(),
        ),
        Obx(() => _bodyWidget(context)),
      ],
    );
  }

  Widget _drawerMenu(BuildContext context) {
    return Container(
      color: bgColor,
      width: controller.sizeDrawerMenu.value,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          AppWidgets.listTile(
            icon: Icons.dashboard,
            title: 'Dashboard',
            onTap: () {},
          ),
          AppWidgets.listTile(
            icon: Icons.face,
            title: 'Driver',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      color: whiteColor,
      width:
          MediaQuery.of(context).size.width - controller.sizeDrawerMenu.value,
      height: MediaQuery.of(context).size.height,
      child: Text(
        '',
        style: AppTextStyle.headline2,
      ),
    );
  }
}
