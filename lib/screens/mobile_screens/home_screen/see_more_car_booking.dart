import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:driver_app/view_model/mobile_view_model/recent_car_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final controller = Get.put(RecentCarBookingViewModel());

class SeeMoreCarBooking extends StatelessWidget {
  SeeMoreCarBooking({super.key});

  final List<Map<String, dynamic>> dataCarBooking = [
    {
      "No": "1",
      "Date": "2023-08-15",
      "Location": "Phnom Penh",
      "BookBy": "Po Chanrith",
      "Status": "Approved",
    },
    {
      "No": "2",
      "Date": "2023-08-16",
      "Location": "Battambang",
      "BookBy": "Chum Aranya",
      "Status": "Approved",
    },
    {
      "No": "3",
      "Date": "2023-08-16",
      "Location": "Siem Reap",
      "BookBy": "Heng Sreylin",
      "Status": "Approved",
    },
    {
      "No": "4",
      "Date": "2023-08-16",
      "Location": "Prey Veng",
      "BookBy": "Nin Sreydavy",
      "Status": "Pending",
    },
    {
      "No": "5",
      "Date": "2023-08-17",
      "Location": "Kampong Cham",
      "BookBy": "Nopnem Narong",
      "Status": "Pending",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: blackColor),
        backgroundColor: whiteColor,
        title: Text(
          "Recent Car Booking",
          style: MobileAppTextStyle.headline1.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: _bodyApp(context),
    );
  }

  Widget _bodyApp(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _paginatedDataTable(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _paginatedDataTable(BuildContext context) {
    return PaginatedDataTable(
      source: _TableData(),
      showCheckboxColumn: true,
      horizontalMargin: 20,
      columnSpacing: 18.sp,
      rowsPerPage: controller.dataCarBooking.isNotEmpty
          ? controller.dataCarBooking.length
          : controller.dataCarBooking.length >= 5
              ? 5
              : 1,
      columns: [
        _dataColumn("No."),
        _dataColumn("Date Book"),
        _dataColumn("Location"),
        _dataColumn("Book By"),
        _dataColumn("Status"),
      ],
    );
  }

  DataColumn _dataColumn(String txt) {
    return DataColumn(
      label: Text(
        txt,
        style: MobileAppTextStyle.headline1.copyWith(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

class _TableData extends DataTableSource {
  final List<Map<String, dynamic>> _data = List.generate(
    controller.dataCarBooking.length,
    (index) => controller.dataCarBooking[index],
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
        _dataCell(index, "Location"),
        _dataCell(index, "BookBy"),
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
        overflow: TextOverflow.ellipsis,
        style: MobileAppTextStyle.title1.copyWith(
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
