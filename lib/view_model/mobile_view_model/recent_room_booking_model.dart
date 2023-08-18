import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentRoomBookingViewModel extends GetxController {
  final searchRecentRoomBooking = TextEditingController().obs;

  List<dynamic> dataRomBooking = [
    {
      "No.": "1",
      "DateBooked": "2023-07-01",
      "RoomName": "Pka Romdoul",
      "Status": "Closed",
    },
    {
      "No.": "2",
      "DateBooked": "2023-06-02",
      "RoomName": "Sen Pidaor",
      "Status": "Closed",
    },
    {
      "No.": "3",
      "DateBooked": "2023-05-02",
      "RoomName": "Pka Mliah",
      "Status": "Closed",
    },
  ];
}
