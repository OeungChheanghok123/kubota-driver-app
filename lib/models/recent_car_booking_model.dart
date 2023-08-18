import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentCarBookingViewModel extends GetxController {
  final searchRecentCarBooking = TextEditingController().obs;

  List<dynamic> dataCarBooking = [
    {
      "No.": "1",
      "DateBooked": "2023-08-01",
      "Location": "Phnom Penh",
      "LastLocation": "Phnom Penh",
      "Detail": "Go to Bank Acleda",
      "People": "2",
      "DepartureDate": "2023-08-01",
      "ReturnDate": "2023-08-01",
      "BookBy": "Heng Sreylin",
      "StatusDate": "2023-08-01",
      "Status": "Approved",
    },
    {
      "No.": "2",
      "DateBooked": "2023-08-02",
      "Location": "Battambang",
      "LastLocation": "Phnom Penh",
      "Detail": "Go to Bank Acleda",
      "People": "2",
      "DepartureDate": "2023-08-01",
      "ReturnDate": "2023-08-01",
      "BookBy": "Heng Sreylin",
      "StatusDate": "2023-08-01",
      "Status": "Approved",
    },
    {
      "No.": "3",
      "DateBooked": "2023-08-02",
      "Location": "Siem Reap",
      "LastLocation": "Phnom Penh",
      "Detail": "Go to Bank Acleda",
      "People": "2",
      "DepartureDate": "2023-08-01",
      "ReturnDate": "2023-08-01",
      "BookBy": "Heng Sreylin",
      "StatusDate": "2023-08-01",
      "Status": "Approved",
    },
    {
      "No.": "4",
      "DateBooked": "2023-08-10",
      "Location": "Bantey Meanchey",
      "LastLocation": "Phnom Penh",
      "Detail": "Go to Bank Acleda",
      "People": "2",
      "DepartureDate": "2023-08-01",
      "ReturnDate": "2023-08-01",
      "BookBy": "Heng Sreylin",
      "StatusDate": "2023-08-01",
      "Status": "Pending",
    },
  ];
}
