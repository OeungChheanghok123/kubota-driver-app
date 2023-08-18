import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/web_screens/car_register/car_booking_screen.dart';
import 'package:driver_app/screens/mobile_screens/home_screen/home_screen.dart';
import 'package:driver_app/screens/mobile_screens/rooms_screen/room_booking_screen.dart';
import 'package:driver_app/screens/mobile_screens/settings_screen/settings_screen.dart';
import 'package:driver_app/view_model/mobile_view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileDashboardScreen extends StatelessWidget {
  MobileDashboardScreen({super.key});

  final controller = Get.put(DashboardModel());
  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    CarBookingScreen(),
    RoomBookingScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: Obx(() => bottomBar),
    );
  }

  Widget get body {
    return Obx(
      () => Center(
        child: _pages.elementAt(
          controller.currentIndex.value,
        ),
      ),
    );
  }

  Widget get bottomBar {
    return BottomNavigationBar(
      elevation: 5,
      onTap: controller.onItemTapped,
      currentIndex: controller.currentIndex.value,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: shapeColor,
          icon: Icon(Icons.house),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: shapeColor,
          icon: Icon(Icons.local_shipping),
          label: 'Car Booking',
        ),
        BottomNavigationBarItem(
          backgroundColor: shapeColor,
          icon: Icon(Icons.meeting_room),
          label: 'Room Booking',
        ),
        BottomNavigationBarItem(
          backgroundColor: shapeColor,
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
    );
  }
}
