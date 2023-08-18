import 'package:driver_app/view_model/web_view_model/panel_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenViewModel extends GetxController {
  var sizeDrawerMenu = 250.0.obs;
  var isDrawerMenu = true.obs;
  var panelPageValue = PanelPageStatus.dashboard.obs;
  var dropDownSelectedItem = "USA".obs;

  final searchController = TextEditingController();

  void funcDrawerMenu() {
    isDrawerMenu.value = !isDrawerMenu.value;
    if (isDrawerMenu.value == false) {
      sizeDrawerMenu.value = 0.0;
    } else {
      sizeDrawerMenu.value = 250.0;
    }
  }
}
