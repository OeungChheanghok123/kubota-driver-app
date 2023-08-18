import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/web_screens/car_register/car_add_screen.dart';
import 'package:driver_app/screens/web_screens/car_register/car_manage_screen.dart';
import 'package:driver_app/screens/web_screens/car_register/car_view_screen.dart';
import 'package:driver_app/screens/web_screens/driver/driver_add_screen.dart';
import 'package:driver_app/screens/web_screens/driver/driver_manage_screen.dart';
import 'package:driver_app/screens/web_screens/driver/driver_view_screen.dart';
import 'package:driver_app/screens/web_screens/login/web_login_screen.dart';
import 'package:driver_app/screens/web_screens/user_registration/user_registration_screen.dart';
import 'package:driver_app/screens/web_screens/bookings/booking_screen.dart';
import 'package:driver_app/screens/web_screens/dashboard/dashboard_screen.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:driver_app/view_model/web_view_model/main_screen_view_model.dart';
import 'package:driver_app/view_model/web_view_model/panel_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenWeb extends StatelessWidget {
  MainScreenWeb({super.key});

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
        onTap: () => controller.funcDrawerMenu(),
        child: Obx(
          () => controller.isDrawerMenu.value == true
              ? const Row(
                  children: [
                    SizedBox(width: defaultPaddin / 2),
                    Icon(Icons.arrow_left, color: blackColor, size: 16),
                    Icon(Icons.menu, color: blackColor, size: 24),
                  ],
                )
              : const Row(
                  children: [
                    SizedBox(width: defaultPaddin / 2),
                    Icon(Icons.menu, color: blackColor, size: 24),
                    Icon(Icons.arrow_right, color: blackColor, size: 16),
                  ],
                ),
        ),
      ),
      title: Row(
        children: [
          Text('Driver App', style: WebAppTextStyle.headline2),
          const SizedBox(width: defaultPaddin * 5),
          Text('Branch:', style: WebAppTextStyle.headline2),
          Text(' Head Office', style: WebAppTextStyle.body),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => controller.isDrawerMenu.value == true
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
          _buildLogo(
            logo: "assets/images/w3-school.png",
            name: "PO Chanrith",
            role: "Super Admin",
          ),
          AppWidgets.underLine(
            width: controller.sizeDrawerMenu.value,
            height: 2,
          ),
          AppWidgets.listTile(
            icon: Icons.circle,
            title: 'Dashboard',
            onTap: () {
              controller.panelPageValue.value = PanelPageStatus.dashboard;
            },
          ),
          ExpansionTile(
            title: Text(
              "Driver",
              style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
            ),
            leading: const Icon(
              Icons.circle,
              color: primaryColor,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: Text(
                  "Add",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value = PanelPageStatus.driverAdd;
                },
              ),
              ListTile(
                title: Text(
                  "View",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value = PanelPageStatus.driverView;
                },
              ),
              ListTile(
                title: Text(
                  "Manage",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value =
                      PanelPageStatus.driverManage;
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(
              "Car Register",
              style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
            ),
            leading: const Icon(
              Icons.circle,
              color: primaryColor,
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: primaryColor),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: Text(
                  "Add",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value =
                      PanelPageStatus.carRegisterAdd;
                },
              ),
              ListTile(
                title: Text(
                  "View",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value =
                      PanelPageStatus.carRegisterView;
                },
              ),
              ListTile(
                title: Text(
                  "Manage",
                  style: WebAppTextStyle.headline2.copyWith(color: whiteColor),
                ),
                onTap: () {
                  controller.panelPageValue.value =
                      PanelPageStatus.carRegisterManage;
                },
              ),
            ],
          ),
          AppWidgets.listTile(
            icon: Icons.circle,
            title: 'User Registation',
            onTap: () {
              controller.panelPageValue.value = PanelPageStatus.userRegistation;
            },
          ),
          AppWidgets.listTile(
            icon: Icons.circle,
            title: 'Bookings',
            onTap: () {
              controller.panelPageValue.value = PanelPageStatus.bookings;
            },
          ),
          AppWidgets.listTile(
            icon: Icons.logout,
            title: 'Log Out',
            trailing: false,
            iconData: Icons.power_settings_new,
            onTap: () {
              controller.isDrawerMenu.value = !controller.isDrawerMenu.value;
              controller.sizeDrawerMenu.value = 0.0;
              controller.panelPageValue.value = PanelPageStatus.logout;
            },
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      color: whiteColor,
      width: width - controller.sizeDrawerMenu.value,
      height: height,
      child: bodyFunc(),
    );
  }

  Widget bodyFunc() {
    switch (controller.panelPageValue.value) {
      case PanelPageStatus.dashboard:
        return DashboardScreen();
      case PanelPageStatus.driverAdd:
        return DriverAddScreen();
      case PanelPageStatus.driverView:
        return DriverViewScreen();
      case PanelPageStatus.driverManage:
        return DriverManageScreen();
      case PanelPageStatus.userRegistation:
        return UserRegistrationScreen();
      case PanelPageStatus.bookings:
        return BookingScreen();
      case PanelPageStatus.logout:
        return const WebLoginScreen();
      case PanelPageStatus.carRegisterAdd:
        return CarAddScreen();
      case PanelPageStatus.carRegisterView:
        return CarViewScreen();
      case PanelPageStatus.carRegisterManage:
        return CarManageScreen();
    }
  }

  Widget _buildLogo({
    required logo,
    required name,
    required role,
  }) {
    return Container(
      margin: const EdgeInsets.all(defaultPaddin),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: defaultPaddin),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: WebAppTextStyle.headline2.copyWith(
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: defaultPaddin / 2),
                Text(
                  role,
                  overflow: TextOverflow.ellipsis,
                  style: WebAppTextStyle.body.copyWith(color: primaryGrayColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
