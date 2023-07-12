
import 'package:day_for_you/app/components/calendar/DateCard.dart';
import 'package:day_for_you/app/modules/app/controllers/app_controller.dart';
import 'package:day_for_you/app/modules/home/controllers/home_controller.dart';
import 'package:day_for_you/app/utils/calendarUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ShrinkedCalendar extends StatelessWidget {
  ShrinkedCalendar({super.key, required this.height});

  final double height;
  final double monthHeight = 30;
  final double toggleBtnHeight = 20;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final globalController = Get.put(AppController());

    return Container(
      height: height,
      child: Column(
        children: [
          Container(
            height: monthHeight,
            child: Center(
              child: Text(
                  '${Get.find<AppController>().selectedDateTime.value.month}월',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            width: double.maxFinite, height: height - toggleBtnHeight - monthHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CalendarUtil.endDateOfMonth(globalController.selectedDateTime.value),
              itemBuilder: (context, idx) {
                return DateCard(date: idx + 1);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
            ),
            width: double.maxFinite, height: toggleBtnHeight,
            alignment: Alignment.center,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: controller.toggleCalendarExpanded,
              icon: const Icon(Icons.arrow_drop_down),
            )
          )
        ],
      ),
    );
  }
}
