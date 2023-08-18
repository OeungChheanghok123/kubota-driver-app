import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverViewModel extends GetxController {
  final firstName = TextEditingController().obs;
  final lastName = TextEditingController().obs;
  final contact = TextEditingController().obs;
  final address = TextEditingController().obs;
  final emailAddress = TextEditingController().obs;
  final password = TextEditingController().obs;

  final searchDriverViewController = TextEditingController().obs;
  final searchDriverManageController = TextEditingController().obs;

  List<dynamic> dataDriver = [
    {
      "No.": "1",
      "DriverName": "Van Sovong",
      "VehicleType": "SUV",
      "PlateNumber": "2BC-2982",
      "Contact": "098288888",
      "Address": "Siem Reap",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "2",
      "DriverName": "Chea Vichet",
      "VehicleType": "Pick-up",
      "PlateNumber": "2BC-6043",
      "Contact": "098288888",
      "Address": "Battambang",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "3",
      "DriverName": "Khen Sokha",
      "VehicleType": "SUV",
      "PlateNumber": "2BC-6876",
      "Contact": "098288888",
      "Address": "Pursat",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "4",
      "DriverName": "Van Sovong",
      "VehicleType": "SUV",
      "PlateNumber": "2BC-2982",
      "Contact": "098288888",
      "Address": "Siem Reap",
      "Email": "abc@kubota.com",
    },
  ];
}
