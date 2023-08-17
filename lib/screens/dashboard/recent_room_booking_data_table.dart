import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/recent_room_booking_model.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<dynamic> filteredRoomBookingData = [];

class RecentRoomDataTableWidget extends StatefulWidget {
  final TextEditingController controller;

  const RecentRoomDataTableWidget({
    super.key,
    required this.controller,
  });

  @override
  State<RecentRoomDataTableWidget> createState() =>
      _RecentRoomDataTableWidget();
}

class _RecentRoomDataTableWidget extends State<RecentRoomDataTableWidget> {
  final mainController = Get.put(MainScreenViewModel());
  final controller = Get.put(RecentRoomBookingViewModel());

  @override
  void initState() {
    filteredRoomBookingData = controller.dataRomBooking;
    super.initState();
  }

  @override
  void dispose() {
    controller.searchRecentRoomBooking.value.text = "";
    super.dispose();
  }

  void onSearchTextChanged(String text) {
    setState(() {
      filteredRoomBookingData = text.isEmpty
          ? controller.dataRomBooking
          : controller.dataRomBooking
              .where((item) =>
                  item['RoomName'].toLowerCase().contains(text.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: defaultPaddin),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 25.sp,
            child: TextField(
              controller: widget.controller,
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Search by Room...',
                hintStyle: TextStyle(fontSize: 14.sp),
                contentPadding: EdgeInsets.only(left: defaultPaddin * 4.sp),
                border: const OutlineInputBorder(),
              ),
              onChanged: onSearchTextChanged,
            ),
          ),
          _paginatedDataTable(context),
        ],
      ),
    );
  }

  Widget _paginatedDataTable(BuildContext context) {
    return PaginatedDataTable(
      source: _TableData(),
      showCheckboxColumn: true,
      horizontalMargin: 20,
      columnSpacing: 18.sp,
      rowsPerPage: filteredRoomBookingData.isNotEmpty
          ? filteredRoomBookingData.length
          : filteredRoomBookingData.length >= 5
              ? 5
              : 1,
      columns: [
        _dataColumn("No."),
        _dataColumn("Date Book"),
        _dataColumn("Room Name"),
        _dataColumn("Status"),
      ],
    );
  }

  DataColumn _dataColumn(String txt) {
    return DataColumn(
      label: Text(
        txt,
        style: WebAppTextStyle.headline1.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class _TableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    filteredRoomBookingData.length,
    (index) => filteredRoomBookingData[index],
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
        _dataCell(index, "DateBooked"),
        _dataCell(index, "RoomName"),
        _dataCell(index, "Status"),
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
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
