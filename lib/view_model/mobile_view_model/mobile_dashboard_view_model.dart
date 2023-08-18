import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/mobile_screens/home_screen/home_screen.dart';
import 'package:driver_app/screens/mobile_screens/rooms_screen/room_booking_screen.dart';
import 'package:driver_app/screens/mobile_screens/settings_screen/settings_screen.dart';
import 'package:driver_app/screens/web_screens/car_register/car_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileDashboardViewModel extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> pages = <Widget>[
    HomeScreen(),
    CarBookingScreen(),
    RoomBookingScreen(),
    const SettingsScreen(),
  ];
  final List<Map<String, dynamic>> item = [
    {
      "label": "Home",
      "icon": Icons.house,
    },
    {
      "label": "Car Booking",
      "icon": Icons.local_shipping,
    },
    {
      "label": "Room Booking",
      "icon": Icons.meeting_room,
    },
    {
      "label": "Setting",
      "icon": Icons.settings,
    },
  ];

  BottomNavigationBarItem barItem({
    required String label,
    required IconData iconData,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: shapeColor,
      icon: Icon(iconData),
      label: label,
    );
  }

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
