import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error while loading data from server.',
        style: WebAppTextStyle.headline2,
      ),
    );
  }
}
