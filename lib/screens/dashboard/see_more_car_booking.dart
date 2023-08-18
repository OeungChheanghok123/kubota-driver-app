import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
              _buildColumHeader(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColumHeader() {
    return Container(
      decoration: BoxDecoration(
        color: shapeColor,
        border: Border.all(color: blackColor, width: 0.5),
      ),
      child: Row(
        children: [
          _buildColumnHeaderItem(
            flex: 1,
            txt: "No.",
            rowData: "No",
          ),
          _buildColumnHeaderItem(
            flex: 2,
            txt: "Date",
            rowData: "Date",
          ),
          _buildColumnHeaderItem(
            flex: 2,
            txt: "Location",
            rowData: "Location",
          ),
          _buildColumnHeaderItem(
            flex: 2,
            txt: "By",
            rowData: "BookBy",
          ),
          _buildColumnHeaderItem(
            flex: 1,
            txt: "Status",
            rowData: "Status",
          ),
        ],
      ),
    );
  }

  Widget _buildColumnHeaderItem({
    required int flex,
    required String txt,
    required String rowData,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.all(defaultPaddin * 2.sp),
        decoration: BoxDecoration(
          border: Border.all(color: blackColor, width: 0.5),
        ),
        child: Column(
          children: [
            Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: whiteColor,
              ),
            ),
            ListView.builder(
              itemCount: dataCarBooking.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildColumnDataItem(
                  flex: 0,
                  txt: dataCarBooking[index][rowData],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColumnDataItem({
    required int flex,
    required String txt,
  }) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 16.sp,
        color: blackColor,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: TextAlign.center,
    );
  }
}
