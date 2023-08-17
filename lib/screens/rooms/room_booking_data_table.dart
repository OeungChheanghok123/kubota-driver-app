import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/main_screen_view_model.dart';
import 'package:driver_app/models/room_booking_model.dart';
import 'package:driver_app/utility/web_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

List<dynamic> filteredRoomBookingData = [];

class RoomBookingDataTableWidget extends StatefulWidget {
  final TextEditingController controller;
  final String room;

  const RoomBookingDataTableWidget({
    super.key,
    required this.controller,
    required this.room,
  });

  @override
  State<RoomBookingDataTableWidget> createState() =>
      _RoomBookingDataTableWidget();
}

class _RoomBookingDataTableWidget extends State<RoomBookingDataTableWidget> {
  final mainController = Get.put(MainScreenViewModel());
  final controller = Get.put(RoomBookingModel());

  @override
  void initState() {
    filteredRoomBookingData = controller.dataRomBooking;

    onSearchTextChanged(widget.room);
    super.initState();
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
      child: _paginatedDataTable(context),
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
        _dataColumn("Time"),
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
        _dataCell(index, "Time"),
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
