
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard',
        style: AppTextStyle.headline2,
      ),
    );
  }
}