import 'package:driver_app/view_model/mobile_view_model/mobile_dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileDashboardScreen extends StatelessWidget {
  MobileDashboardScreen({super.key});

  final controller = Get.put(MobileDashboardViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Obx(() => bottomBar),
    );
  }

  Widget get body {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: controller.pages,
      ),
    );
  }

  Widget get bottomBar {
    return BottomNavigationBar(
      elevation: 0,
      onTap: controller.onItemTapped,
      currentIndex: controller.currentIndex.value,
      items: List.generate(
        controller.item.length,
        (index) => controller.barItem(
          label: controller.item[index]['label'],
          iconData: controller.item[index]['icon'],
        ),
      ),
    );
  }
}
