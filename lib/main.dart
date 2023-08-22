import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/screens/web_screens/main_screen/main_screen_web.dart';
import 'package:driver_app/screens/mobile_screens/splash_screen/mobile_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context).textTheme.apply(bodyColor: blackColor),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: screenWidget,
        );
      },
    );
  }

  Widget get screenWidget {
    if (GetPlatform.isWeb) {
      return MainScreenWeb();
    } else if (GetPlatform.isMobile) {
      return const MobileSplashScreen();
    }

    return Container();
  }
}
