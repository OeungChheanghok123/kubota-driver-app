
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Driver',
        style: AppTextStyle.headline2,
      ),
    );
  }
}