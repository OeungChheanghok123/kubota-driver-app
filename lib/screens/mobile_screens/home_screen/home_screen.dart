import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/data_table_widget.dart';
import 'package:driver_app/screens/mobile_screens/home_screen/see_more_car_booking.dart';
import 'package:driver_app/utility/mobile_app_bar.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:driver_app/view_model/mobile_view_model/recent_car_booking_model.dart';
import 'package:driver_app/view_model/mobile_view_model/recent_room_booking_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final carController = Get.put(RecentCarBookingViewModel());
  final roomController = Get.put(RecentRoomBookingViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        excludeHeaderSemantics: true,
        toolbarHeight: 48.sp,
        flexibleSpace: const MobileAppBar(),
      ),
      body: SingleChildScrollView(
        child: _bodyApp(context),
      ),
    );
  }

  Widget _bodyApp (BuildContext context) {
    return Column (
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: defaultPaddin * 2.sp),
                child: Center(
                  child: Text(
                    "Dashboard",
                    style: MobileAppTextStyle.headline1.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCardView(
                    context,
                    txt: "Car",
                    num: "3 Cars",
                  ),
                  _buildCardView(
                    context,
                    txt: "Room",
                    num: "2 Rooms",
                  ),
                  _buildCardView(
                    context,
                    txt: "Driver",
                    num: "3 Drivers",
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
          padding: EdgeInsets.only(top: defaultPaddin * 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recently Car Booking",
                style: MobileAppTextStyle.headline1.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              TextButton(
                onPressed: () => Get.to(SeeMoreCarBooking()),
                child: Text(
                  "See more...",
                  style: MobileAppTextStyle.headline1.copyWith(
                    fontSize: 14.sp,
                    color: secondGraydColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 3.sp),
            child: DataTableWidget(
              con: carController.searchRecentCarBooking.value,
              scourceData: carController.dataCarBooking,
              hintText: 'Search by Location...',
              fillterBy: 'Location',
              columnHeader: const [
                'N.',
                'Date',
                'Location',
                'Book By',
                'Status',
              ],
              rowData: const [
                'No.',
                'DateBooked',
                'Location',
                'BookBy',
                'Status',
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
          padding: EdgeInsets.only(top: defaultPaddin * 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Room Booking",
                style: MobileAppTextStyle.headline1.copyWith(
                  fontSize: 16.sp,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See more...",
                  style: MobileAppTextStyle.headline1.copyWith(
                    fontSize: 14.sp,
                    color: secondGraydColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 3.sp),
            child: DataTableWidget(
              con: roomController.searchRecentRoomBooking.value,
              scourceData: roomController.dataRomBooking,
              hintText: 'Search by Room...',
              fillterBy: 'RoomName',
              columnHeader: const [
                'N.',
                'Date',
                'Room',
                'Book By',
                'Status',
              ],
              rowData: const [
                'no',
                'dateBooked',
                'roomName',
                'bookBy',
                'status',
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPaddin * 5.sp),
      ],
    );
  }

  Widget _buildCardView(
    BuildContext context, {
    required String txt,
    required String num,
  }) {
    return Container(
      width: 40.sp,
      height: 40.sp,
      margin: EdgeInsets.only(top: defaultPaddin * 4.sp),
      padding: EdgeInsets.all(defaultPaddin * 3.sp),
      decoration: BoxDecoration(
        color: shapeColor,
        borderRadius: BorderRadius.circular(defaultRadius * 4.sp),
      ),
      child: Column(
        children: [
          Text(
            "Available\n$txt",
            textAlign: TextAlign.center,
            style: MobileAppTextStyle.headline2.copyWith(
              color: whiteColor,
            ),
          ),
          const Spacer(),
          Text(
            num,
            textAlign: TextAlign.center,
            style: MobileAppTextStyle.headline2.copyWith(
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
