import 'dart:math';
import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const dataLength = 100;

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final mainController = Get.put(MainScreenViewModel());
  final cardViewList = ["50 Users", "5 Drivers", "8 Bookings", "20 Vehicles"];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: whiteColor,
        width: width - mainController.sizeDrawerMenu.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.appTitle(
              context,
              title: "Dashboard / Overview",
            ),
            Container(
              margin: const EdgeInsets.all(defaultPaddin * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card View
                  SizedBox(
                    height: 35.sp,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        cardViewList.length,
                        (index) => _buildCardView(
                          width: width,
                          txt: cardViewList[index],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: defaultPaddin * 4.sp),
                  // Data Table
                  SizedBox(
                    width: width,
                    child: _paginatedDataTable(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardView({
    required double width,
    required String txt,
  }) {
    return Container(
      width: width / 6.5.sp,
      margin: EdgeInsets.only(right: defaultPaddin * 4.sp),
      padding: const EdgeInsets.all(defaultPaddin),
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.all(
          Radius.circular(defaultRadius * 4.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt,
            style: WebAppTextStyle.headline1.copyWith(
              color: whiteColor,
              fontSize: 13.sp,
            ),
          ),
          const Spacer(),
          AppWidgets.underLine(
            width: double.infinity,
            height: 1,
            color: whiteColor,
          ),
          const SizedBox(height: defaultPaddin / 2),
          Text(
            "View Detail",
            style: WebAppTextStyle.headline1.copyWith(
              color: whiteColor,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _paginatedDataTable(BuildContext context) {
    return PaginatedDataTable(
      source: MyTableData(),
      columnSpacing: 100,
      horizontalMargin: 10,
      rowsPerPage: dataLength >= 10 ? 10 : dataLength,
      showCheckboxColumn: true,
      header: Text(
        'Booking Details',
        style: WebAppTextStyle.headline1.copyWith(fontSize: 12.sp),
      ),
      columns: [
        _dataColumn("No."),
        _dataColumn("Name"),
        _dataColumn("Vehecle Type"),
        _dataColumn("Plate Number"),
        _dataColumn("Booking Date"),
        _dataColumn("Trip Location"),
        _dataColumn("Status"),
      ],
    );
  }

  DataColumn _dataColumn(String txt) {
    return DataColumn(
      label: Text(
        txt,
        style: WebAppTextStyle.headline1.copyWith(
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

class MyTableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    dataLength,
    (index) => {
      "no": index + 1,
      "name": "Item ${index + 1}",
      "vehicle": "SUV",
      "plate": "2BC-${Random().nextInt(1000)}",
      "date": "2023-08-${index + 1}",
      "location": "Siem Reap",
      "status": "Approved",
    },
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
        _dataCell(index, "no"),
        _dataCell(index, "name"),
        _dataCell(index, "vehicle"),
        _dataCell(index, "plate"),
        _dataCell(index, "date"),
        _dataCell(index, "location"),
        _dataCell(index, "status"),
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
        style: WebAppTextStyle.headline1.copyWith(
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
