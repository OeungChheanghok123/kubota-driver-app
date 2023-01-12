import 'package:get/get.dart';

class MainScreenViewModel extends GetxController {
  var sizeDrawerMenu = 250.0.obs;
  var isDrawerMenu = true.obs;

  var panelPageValue = "".obs;

  void funcDrawerMenu() {
    isDrawerMenu.value = !isDrawerMenu.value;
    if (isDrawerMenu.value == false) {
      sizeDrawerMenu.value = 0.0;
    } else {
      sizeDrawerMenu.value = 250.0;
    }
  }
}
