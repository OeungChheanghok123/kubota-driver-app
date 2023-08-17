import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/car_model.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<dynamic> filteredCarData = [];

class CarDatableWidget extends StatefulWidget {
  final TextEditingController controller;

  const CarDatableWidget({
    super.key,
    required this.controller,
  });

  @override
  State<CarDatableWidget> createState() => _CarDatableWidget();
}

class _CarDatableWidget extends State<CarDatableWidget> {
  final mainController = Get.put(MainScreenViewModel());
  final controller = Get.put(CarViewModel());

  @override
  void initState() {
    filteredCarData = controller.dataCar;
    super.initState();
  }

  @override
  void dispose() {
    controller.searchCarViewController.value.text = "";
    controller.searchCarManageController.value.text = "";
    super.dispose();
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filteredCarData = text.isEmpty
          ? controller.dataCar
          : controller.dataCar
              .where((item) => item['VehicleName']
                  .toLowerCase()
                  .contains(text.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Column(
        children: [
          const SizedBox(height: defaultPaddin),
          Padding(
            padding: const EdgeInsets.all(defaultPaddin / 2),
            child: TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hintText: 'Search by Car Name...',
                border: OutlineInputBorder(),
              ),
              onChanged: onSearchTextChanged,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: defaultPaddin / 2),
            child: _paginatedDataTable(context),
          ),
          const SizedBox(height: defaultPaddin * 2),
        ],
      ),
    );
  }

  Widget _paginatedDataTable(BuildContext context) {
    return PaginatedDataTable(
      source: DriverTableData(),
      showCheckboxColumn: true,
      columnSpacing: 100,
      horizontalMargin: 10,
      rowsPerPage: filteredCarData.isNotEmpty
          ? filteredCarData.length
          : filteredCarData.length > 10
              ? 10
              : 1,
      header: Text(
        'Registered Car',
        style: WebAppTextStyle.headline1.copyWith(fontSize: 12.sp),
      ),
      columns: [
        _dataColumn("No."),
        _dataColumn("VehicleName"),
        _dataColumn("VehecleType"),
        _dataColumn("NumberOfSeat"),
        _dataColumn("Driver"),
        _dataColumn("VehicleCategory"),
        _dataColumn("Email"),
      ],
    );
  }

  DataColumn _dataColumn(String txt) {
    return DataColumn(
      label: Text(
        txt,
        style: WebAppTextStyle.headline1.copyWith(
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

class DriverTableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    filteredCarData.length,
    (index) => filteredCarData[index],
  );

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      onSelectChanged: (seleceted) {},
      cells: [
        _dataCell(index, "No."),
        _dataCell(index, "VehicleName"),
        _dataCell(index, "VehicleType"),
        _dataCell(index, "NumberOfSeat"),
        _dataCell(index, "Driver"),
        _dataCell(index, "VehicleCategory"),
        _dataCell(index, "Email"),
      ],
    );
  }

  DataCell _dataCell(
    int index,
    String txt,
  ) {
    return DataCell(
      Text(
        _data[index][txt].toString(),
        style: WebAppTextStyle.title1.copyWith(
          fontSize: 11.sp,
        ),
      ),
    );
  }
}
