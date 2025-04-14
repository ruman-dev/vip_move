import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timeago/timeago.dart';
import 'package:vid_move/core/global_widget/custom_appbar.dart';
import 'package:vid_move/core/global_widget/custom_button.dart';
import 'package:vid_move/core/global_widget/custom_text.dart';
import 'package:vid_move/core/routes/routes.dart';
import 'package:vid_move/core/utils/app_colors.dart';

import '../../controller/schedule_controller.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key, this.addHourCharge, this.serviceCharge});

  final List<String> timeSlot = [
    '07:00 AM',
    '08:30 AM',
    '10:00 AM',
    '11:30 AM',
    '12:00 PM',
    '01:30 PM',
    '03:00 PM',
    '04:30 PM',
    '06:00 PM',
  ];
  final int? addHourCharge;
  final double? serviceCharge;
  final ScheduleController _controller = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Schedule Shifting'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _controller.selectedDate.value,
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: GoogleFonts.poppins(color: AppColors.primary, fontSize: 12.sp, fontWeight: FontWeight.w600),
                    weekendStyle: GoogleFonts.poppins(color: AppColors.primary, fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: false,
                    selectedDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    selectedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(day, _controller.selectedDate.value);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    _controller.updateSelectedDate(selectedDay);
                    print(_controller.selectedDate);
                  },
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextPoppins(text: 'Pick time', fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.darkGrey),
              SizedBox(height: 15.h),
              SizedBox(
                width: double.maxFinite,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 15,
                  children:
                      timeSlot
                          .map(
                            (element) => Obx(
                              () => GestureDetector(
                                onTap: () {
                                  _controller.selectedTimeSlotIndex.value = timeSlot.indexOf(element);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                    color:
                                        _controller.selectedTimeSlotIndex.value == timeSlot.indexOf(element)
                                            ? AppColors.primary
                                            : Colors.white,
                                    border: Border.all(width: 1.5, color: const Color(0xFFE3E3E9)),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Text(
                                    element.toString(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          _controller.selectedTimeSlotIndex.value == timeSlot.indexOf(element)
                                              ? Colors.white
                                              : AppColors.darkGrey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              SizedBox(height: 50.h),
              CustomButton(
                btnText: 'Proceed',
                onPressed: () {
                  if (_controller.selectedTimeSlotIndex.value > -1) {
                    // String formattedDate = DateFormat('EEEE').format(_controller.selectedDate.value);
                    DateTime selectedDate = _controller.selectedDate.value;
                    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(selectedDate);

                    print(formattedDate);

                    Get.toNamed(
                      Routes.mapScreen,
                      parameters: {
                        'date': formattedDate,
                        'slot': timeSlot[_controller.selectedTimeSlotIndex.value],
                        'addHourCharge': addHourCharge.toString(),
                        'serviceCharge': serviceCharge.toString(),
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
