import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/car_booking/car_booking_screen.dart';
import 'package:driver_app/screens/car_request/car_request_screen.dart';
import 'package:driver_app/screens/dashboard/dashboard.dart';
import 'package:driver_app/screens/driver/driver.dart';
import 'package:driver_app/screens/main_screen/main_screen_view_model.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenMobile extends StatelessWidget {
  MainScreenMobile({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(MainScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar,
      body: _bodyWidget(context),
      drawer: Drawer(
        child: _drawerMenu(context),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      backgroundColor: primaryGrayColor,
      elevation: 0,
      centerTitle: false,
      title: Row(
        children: [
          Text('Driver App', style: AppTextStyle.headline2),
          const SizedBox(width: defaultPaddin * 5),
          Text('Branch:', style: AppTextStyle.headline2),
          Text(' Head Office', style: AppTextStyle.body),
        ],
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: blackColor,
              size: 24,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
    );
  }

  Widget _drawerMenu(BuildContext context) {
    return Container(
      color: bgColor,
      width: controller.sizeDrawerMenu.value,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          const SizedBox(height: defaultPaddin),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/w3-school.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: defaultPaddin / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oeung Chheanghok',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.headline2
                            .copyWith(color: primaryColor),
                      ),
                      const SizedBox(height: defaultPaddin / 2),
                      Text(
                        'Application Manegement Officer',
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTextStyle.body.copyWith(color: primaryGrayColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPaddin),
          _buildUnderLine(width: controller.sizeDrawerMenu.value, height: 2),
          AppWidgets.listTile(
            icon: Icons.dashboard,
            title: 'Dashboard',
            onTap: () {
              controller.panelPageValue.value = "Dashboard";
              Navigator.pop(context);
            },
          ),
          AppWidgets.listTile(
            icon: Icons.face,
            title: 'Driver',
            onTap: () {
              controller.panelPageValue.value = "Driver";
              Navigator.pop(context);
            },
          ),
          AppWidgets.listTile(
            icon: Icons.local_mall,
            title: 'Car Booking',
            onTap: () {
              controller.panelPageValue.value = "Car Booking";
              Navigator.pop(context);
            },
          ),
          AppWidgets.listTile(
            icon: Icons.local_shipping,
            title: 'Car Request',
            onTap: () {
              controller.panelPageValue.value = "Car Request";
              Navigator.pop(context);
            },
          ),
          AppWidgets.listTile(
            icon: Icons.logout,
            title: 'Log Out',
            trailing: false,
            iconData: Icons.power_settings_new,
            onTap: () {
              controller.panelPageValue.value = "Log Out";
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUnderLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      color: secondColor,
    );
  }

  Widget _bodyWidget(BuildContext context) {
    controller.sizeDrawerMenu.value = 0;
    return Obx(
      () => Container(
        color: whiteColor,
        width:
            MediaQuery.of(context).size.width - controller.sizeDrawerMenu.value,
        height: MediaQuery.of(context).size.height,
        child: controller.panelPageValue.value == "Dashboard"
            ? DashboardScreen()
            : controller.panelPageValue.value == "Driver"
                ? DriverScreen()
                : controller.panelPageValue.value == "Car Booking"
                    ? CarBookingScreen()
                    : controller.panelPageValue.value == "Car Request"
                        ? CarRequestScreen()
                        : DashboardScreen(),
      ),
    );
  }
}
