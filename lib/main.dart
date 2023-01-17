import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/main_screen/main_screen_mobile.dart';
import 'package:driver_app/screens/main_screen/main_screen_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: blackColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: screenWidget,
    );
  }

  Widget get screenWidget {
    if (GetPlatform.isWeb) {
      return MainScreenWeb();
    } else if (GetPlatform.isMobile) {
      return MainScreenMobile();
    }

    return Container();
  }
}
