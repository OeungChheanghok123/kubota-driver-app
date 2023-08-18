import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomBookingModel extends GetxController {
  final roomList = [
    {
      "ID": "1",
      "roomName": "Pka Romdoul Room",
      "roomDetail":
          "Phka Romduol room is the largest room for host the meeting in kubota cambodia this room can be held with max people up to 20people. this room has 80inch monitor it located at KBC side in front of KBC's MD room.",
      "imageRoom": "assets/images/room_1.png",
      "qty": 20,
    },
    {
      "ID": "2",
      "roomName": "Sen Pidaor Room",
      "roomDetail":
          "Sen Pidaor Room is the largest room for host the meeting in kubota cambodia this room can be held with max people up to 8 people. this room has 55 Inch monitor it located at KBC side in front of KBC's MD room.",
      "imageRoom": "assets/images/room_2.png",
      "qty": 8,
    },
    {
      "ID": "3",
      "roomName": "Sen Kraaub Room",
      "roomDetail":
          "Sen Kraaub Room is the largest room for host the meeting in kubota cambodia this room can be held with max people up to 20people. this room has 55 Inch monitor it located at KLC side in front of KLC's President room.",
      "imageRoom": "assets/images/room_3.png",
      "qty": 8,
    },
    {
      "ID": "4",
      "roomName": "Pka Mliah Room",
      "roomDetail":
          "Pka Mliah Room is the largest room for host the meeting in kubota cambodia this room can be held with max people up to 20people. this room has 80inch monitor it located at KLC side in front of KLC's President room.",
      "imageRoom": "assets/images/room_4.png",
      "qty": 8,
    },
  ];

  final date = TextEditingController().obs;
  final sartTime = TextEditingController().obs;
  final endTime = TextEditingController().obs;
  final participant = TextEditingController().obs;

  List<dynamic> dataRomBooking = [
    {
      "No.": "1",
      "Time": "10:00AM - 12:00PM",
      "RoomName": "Pka Romdoul Room",
      "Status": "Pending",
    },
    {
      "No.": "2",
      "Time": "13:00AM - 14:00PM",
      "RoomName": "Sen Pidaor Room",
      "Status": "Approved",
    },
    {
      "No.": "3",
      "Time": "14:00AM - 17:00PM",
      "RoomName": "Pka Mliah Room",
      "Status": "Approved",
    },
  ];
}
