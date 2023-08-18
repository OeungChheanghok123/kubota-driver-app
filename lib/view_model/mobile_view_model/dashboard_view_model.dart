import 'package:get/get.dart';

class DashboardModel extends GetxController {
  var currentIndex = 0.obs;

  void onItemTapped(int index) {
    currentIndex.value = index;
  }

}
