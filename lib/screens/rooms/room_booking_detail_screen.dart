import 'package:driver_app/models/recent_room_booking_model.dart';
import 'package:driver_app/models/room_booking_model.dart';
import 'package:driver_app/screens/rooms/room_booking_data_table.dart';
import 'package:driver_app/utility/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:driver_app/constants/constants.dart';
import 'package:driver_app/utility/mobile_text_style.dart';

class RoomBookingDetailScreen extends StatefulWidget {
  final String roomName;
  final String imageRoom;
  final String roomDetail;

  const RoomBookingDetailScreen({
    Key? key,
    required this.roomName,
    required this.imageRoom,
    required this.roomDetail,
  }) : super(key: key);

  @override
  State<RoomBookingDetailScreen> createState() =>
      _RoomBookingDetailScreenState();
}

class _RoomBookingDetailScreenState extends State<RoomBookingDetailScreen> {
  final controller = Get.put(RecentRoomBookingViewModel);
  final roomBookingCon = Get.put(RoomBookingModel());

  final searchController = TextEditingController().obs;
  final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    debugPrint(today);
    searchController.value.text = today;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        excludeHeaderSemantics: true,
        leading: const BackButton(color: blackColor),
        title: Text(
          widget.roomName,
          style: MobileAppTextStyle.headline1.copyWith(
            fontSize: 18.sp,
          ),
        ),
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
          margin: EdgeInsets.symmetric(
            horizontal: defaultPaddin * 5.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageAndDetail(context),
              _buildDateTextField(
                context,
                hintText: 'Date',
                txt: 'Select Date',
                controller: roomBookingCon.date.value,
              ),
              SizedBox(height: defaultPaddin * 4.sp),
              Text(
                "Schedule",
                style: MobileAppTextStyle.headline1,
              ),
              // SizedBox(height: defaultPaddin * 4.sp),
              // _buildTimeTextField(
              //   context,
              //   hintText: 'Time',
              //   txt: 'Start Time',
              //   controller: roomBookingCon.sartTime.value,
              // ),
              // SizedBox(height: defaultPaddin * 4.sp),
              // _buildTimeTextField(
              //   context,
              //   hintText: 'Time',
              //   txt: 'End Time',
              //   controller: roomBookingCon.endTime.value,
              // ),
              // _buildButtonBooking(
              //   'Booking',
              //   onTap: () {},
              // ),
            ],
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 3.sp),
            child: RoomBookingDataTableWidget(
              controller: searchController.value,
              room: widget.roomName,
            ),
          ),
        ),
        _buildButtonBooking(
          'Start Booking',
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (ctx) => _buildBottomSheet(ctx),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageAndDetail(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 55.sp,
          margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 4.sp),
          decoration: BoxDecoration(
            color: shapeColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                defaultRadius * 5.sp,
              ),
            ),
            image: DecorationImage(
              image: AssetImage(widget.imageRoom),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: defaultPaddin * 4.sp,
          ),
          child: Text(
            widget.roomDetail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateTextField(
    BuildContext context, {
    required String txt,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: MobileAppTextStyle.headline1.copyWith(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: blackColor,
              ),
            ),
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2030),
            );

            if (pickedDate != null) {
              String formatDate = DateFormat('yyyy-MM-dd').format(pickedDate);

              setState(() {
                controller.text = formatDate;
              });
            } else {
              debugPrint("Date is not selected");
            }
          },
        ),
      ],
    );
  }

  Widget _buildTimeTextField(
    BuildContext context, {
    required String txt,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: MobileAppTextStyle.headline1.copyWith(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.schedule),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: blackColor,
              ),
            ),
          ),
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: Get.context!,
            );

            if (pickedTime != null) {
              DateTime parsedTime = DateFormat.jm().parse(
                pickedTime.format(Get.context!).toString(),
              );

              String formatTime = DateFormat('hh:mm aa').format(parsedTime);

              setState(() {
                controller.text = formatTime;
              });
            } else {
              debugPrint("Time is not selected");
            }
          },
        ),
      ],
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String txt,
    required TextEditingController controller,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: MobileAppTextStyle.headline1.copyWith(
            color: blackColor.withOpacity(0.5),
          ),
        ),
        SizedBox(height: defaultPaddin * 2.sp),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonBooking(
    String txt, {
    required onTap,
  }) {
    return Container(
      margin: EdgeInsets.all(defaultPaddin * 5.sp),
      child: AppWidgets.button(
        txt,
        backgroundColor: shapeColor,
        onTap: onTap,
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 100.sp,
      padding: EdgeInsets.all(defaultPaddin * 2.sp),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Please select info for booking the room',
              style: MobileAppTextStyle.headline2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPaddin * 4.sp),
            child: Column(
              children: [
                _buildDateTextField(
                  context,
                  controller: roomBookingCon.date.value,
                  hintText: "Date",
                  txt: "Booking Date",
                ),
                SizedBox(height: defaultPaddin * 4.sp),
                _buildTimeTextField(
                  context,
                  controller: roomBookingCon.sartTime.value,
                  hintText: "Time",
                  txt: "Start Time",
                ),
                SizedBox(height: defaultPaddin * 4.sp),
                _buildTimeTextField(
                  context,
                  controller: roomBookingCon.endTime.value,
                  hintText: "Time",
                  txt: "End Time",
                ),
                SizedBox(height: defaultPaddin * 4.sp),
                _buildTextField(
                  context,
                  controller: roomBookingCon.participant.value,
                  hintText: "Participant",
                  txt: "Select Participant",
                ),
              ],
            ),
          ),
          _buildButtonBooking(
            'Comfirm booking',
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
