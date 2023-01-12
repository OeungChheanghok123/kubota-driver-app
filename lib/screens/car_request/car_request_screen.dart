import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/text_style.dart';
import 'package:flutter/material.dart';

class CarRequestScreen extends StatelessWidget {
  const CarRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultPaddin),
      child: Column(
        children: [
          Text('Car Request', style: AppTextStyle.headline1),
        ],
      ),
    );
  }

}