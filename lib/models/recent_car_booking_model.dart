import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentCarBookingViewModel extends GetxController {
  final searchRecentCarBooking = TextEditingController().obs;

  List<dynamic> dataCarBooking = [
    {
      "No.": "1",
      "DateBooked": "2023-08-01",
      "Location": "Phnom Penh",
      "Status": "Approved",
    },
    {
      "No.": "2",
      "DateBooked": "2023-08-02",
      "Location": "Battambang",
      "Status": "Approved",
    },
    {
      "No.": "3",
      "DateBooked": "2023-08-02",
      "Location": "Siem Reap",
      "Status": "Approved",
    },
    {
      "No.": "4",
      "DateBooked": "2023-08-10",
      "Location": "Bantey Meanchey",
      "Status": "Pending",
    },
  ];
}
