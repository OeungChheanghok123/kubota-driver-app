import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarViewModel extends GetxController {
  final vehicleName = TextEditingController().obs;
  final plateNumber = TextEditingController().obs;
  final seat = TextEditingController().obs;
  final driver = TextEditingController().obs;
  final emailAddress = TextEditingController().obs;
  final category = TextEditingController().obs;

  final searchCarViewController = TextEditingController().obs;
  final searchCarManageController = TextEditingController().obs;

  List<dynamic> dataCar = [
    {
      "No.": "1",
      "VehicleName": "Ford Everest",
      "VehicleType": "SUV",
      "NumberOfSeat": "7",
      "Driver": "Van Sovong",
      "VehicleCategory": "KLC",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "2",
      "VehicleName": "Toyota Vigo",
      "VehicleType": "Pick-up",
      "NumberOfSeat": "5",
      "Driver": "Chea Vichet",
      "VehicleCategory": "KBC",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "3",
      "VehicleName": "Toyota Hicae",
      "VehicleType": "Van",
      "NumberOfSeat": "15",
      "Driver": "Khen Sokha",
      "VehicleCategory": "KLC",
      "Email": "abc@kubota.com",
    },
    {
      "No.": "4",
      "VehicleName": "Mazada BT50",
      "VehicleType": "Pick-up",
      "NumberOfSeat": "5",
      "Driver": "Sothea",
      "VehicleCategory": "KLC",
      "Email": "abc@kubota.com",
    },
  ];
}
