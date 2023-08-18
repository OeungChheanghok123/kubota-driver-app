import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:driver_app/view_model/mobile_view_model/driver_view_model.dart';
import 'package:driver_app/view_model/web_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<dynamic> filteredDriverData = [];

class DriverDatableWidget extends StatefulWidget {
  final TextEditingController controller;

  const DriverDatableWidget({
    super.key,
    required this.controller,
  });

  @override
  State<DriverDatableWidget> createState() => _DriverDatableWidget();
}

class _DriverDatableWidget extends State<DriverDatableWidget> {
  final mainController = Get.put(MainScreenViewModel());
  final controller = Get.put(DriverViewModel());

  @override
  void initState() {
    filteredDriverData = controller.dataDriver;
    super.initState();
  }

  @override
  void dispose() {
    controller.searchDriverViewController.value.text = "";
    controller.searchDriverManageController.value.text = "";
    super.dispose();
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filteredDriverData = text.isEmpty
          ? controller.dataDriver
          : controller.dataDriver
              .where((item) =>
                  item['DriverName'].toLowerCase().contains(text.toLowerCase()))
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
                hintText: 'Search by Name...',
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
      rowsPerPage: filteredDriverData.isNotEmpty
          ? filteredDriverData.length
          : filteredDriverData.length >= 10
              ? 10
              : 1,
      header: Text(
        'Registered Driver',
        style: WebAppTextStyle.headline1.copyWith(fontSize: 12.sp),
      ),
      columns: [
        _dataColumn("No."),
        _dataColumn("DriverName"),
        _dataColumn("Vehecle Type"),
        _dataColumn("Plate Number"),
        _dataColumn("Contact"),
        _dataColumn("Address"),
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
    filteredDriverData.length,
    (index) => filteredDriverData[index],
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
      cells: [
        _dataCell(index, "No."),
        _dataCell(index, "DriverName"),
        _dataCell(index, "VehicleType"),
        _dataCell(index, "PlateNumber"),
        _dataCell(index, "Contact"),
        _dataCell(index, "Address"),
        _dataCell(index, "Email"),
      ],
      onSelectChanged: (seleceted) {},
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
