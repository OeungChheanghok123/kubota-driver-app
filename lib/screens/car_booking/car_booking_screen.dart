
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class CarBookingScreen extends StatelessWidget {
  const CarBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Car Booking',
        style: AppTextStyle.headline2,
      ),
    );
  }
}