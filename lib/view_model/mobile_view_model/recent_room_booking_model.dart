import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentRoomBookingViewModel extends GetxController {
  final searchRecentRoomBooking = TextEditingController().obs;

  List<dynamic> dataRomBooking = [
    {
      "no": "1",
      "dateBooked": "2023-07-01",
      "roomName": "Pka Romdoul",
      "bookBy": "Po Chanrith",
      "status": "Closed",
    },
    {
      "no": "2",
      "dateBooked": "2023-06-02",
      "roomName": "Sen Pidaor",
      "bookBy": "Oeung Chheanghok",
      "status": "Closed",
    },
    {
      "no": "3",
      "dateBooked": "2023-05-02",
      "roomName": "Pka Mliah",
      "bookBy": "Heng Sreylin",
      "status": "Closed",
    },
  ];
}
