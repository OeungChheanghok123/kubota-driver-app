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
        onTap: () => controller.funcDrawerMenu(),
        child: Obx(
          () => controller.isDrawerMenu.value == true
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
      title: Row(
        children: [
          Text('Driver App', style: AppTextStyle.headline2),
          const SizedBox(width: defaultPaddin * 5),
          Text('Branch:', style: AppTextStyle.headline2),
          Text(' Head Office', style: AppTextStyle.body),
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

  Widget _buildUnderLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      color: secondColor,
    );
  }
}
