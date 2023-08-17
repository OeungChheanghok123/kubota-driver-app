import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/models/room_booking_model.dart';
import 'package:driver_app/screens/rooms/room_booking_detail_screen.dart';
import 'package:driver_app/utility/mobile_app_bar.dart';
import 'package:driver_app/utility/mobile_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoomBookingScreen extends StatelessWidget {
  RoomBookingScreen({super.key});

  final con = Get.put(RoomBookingModel());

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

  Widget _bodyApp(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 5.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: defaultPaddin * 2.sp,
                  bottom: defaultPaddin * 3.sp,
                ),
                child: Center(
                  child: Text(
                    "Meeting Room",
                    style: MobileAppTextStyle.headline1.copyWith(
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: con.roomList.length,
                itemBuilder: (context, index) {
                  var roomName = con.roomList[index]['roomName'].toString();
                  var imgRoom = con.roomList[index]['imageRoom'].toString();
                  var qty = con.roomList[index]['qty'].toString();
                  var detailRoom = con.roomList[index]['roomDetail'].toString();
                  return InkWell(
                    onTap: () => Get.to(
                      RoomBookingDetailScreen(
                        roomName: roomName,
                        imageRoom: imgRoom,
                        roomDetail: detailRoom,
                      ),
                      transition: Transition.rightToLeft,
                    ),
                    child: _buildCardView(
                      context,
                      img: imgRoom,
                      name: roomName,
                      qty: int.parse(qty),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardView(
    BuildContext context, {
    required String img,
    required String name,
    required int qty,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 45.sp,
      margin: EdgeInsets.symmetric(vertical: defaultPaddin * 3.sp),
      padding: EdgeInsets.all(defaultPaddin * 3.sp),
      decoration: BoxDecoration(
        color: primaryGrayColor,
        borderRadius: BorderRadius.all(
          Radius.circular(defaultRadius * 5.sp),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 45.sp,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultRadius * 5.sp),
              ),
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: defaultPaddin * 4.sp),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: MobileAppTextStyle.headline2,
                ),
                const Spacer(),
                Text(
                  "18th Floor",
                  style: MobileAppTextStyle.title2,
                ),
                const Spacer(),
                Text(
                  "Max Person: $qty People",
                  style: MobileAppTextStyle.title2,
                ),
                SizedBox(height: defaultPaddin * 3.sp),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "View Schedule",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: shapeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
