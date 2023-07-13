
import 'package:day_for_you/app/components/calendar/DateCard.dart';
import 'package:day_for_you/app/modules/app/controllers/app_controller.dart';
import 'package:day_for_you/app/modules/home/controllers/home_controller.dart';
import 'package:day_for_you/app/utils/calendarUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ShrinkedCalendar extends StatefulWidget {
  ShrinkedCalendar({super.key, required this.height});

  final double height;

  @override
  State<ShrinkedCalendar> createState() => _ShrinkedCalendarState();
}

class _ShrinkedCalendarState extends State<ShrinkedCalendar> {
  final double monthHeight = 30;
  final double toggleBtnHeight = 20;

  final dateKeys = <GlobalKey>[];

  List<Widget> buildDateCardsWithKeys (int maxDate) {
    final List<Widget> cardList = <Widget>[];

    for(int i = 0; i < maxDate; i++) {
      dateKeys.add(GlobalKey());
      cardList.add(DateCard(date: i + 1, dateKey: dateKeys[i]));
    }

    return cardList;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final globalController = Get.put(AppController());

    return Container(
      height: widget.height,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: monthHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    padding: const EdgeInsets.only(right: 8.0),
                    onPressed: () {
                      if (kDebugMode) {
                        print('left');
                      }
                      // globalController.onClickMonth(-1);
                      // print(globalController.selectedDateTime);
                    },
                    icon: const Icon(Icons.arrow_back_ios,size: 14.0,)),
                Obx(() => Text(
                    '${Get.find<AppController>().selectedDateTime.value.month}월',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                IconButton(
                    padding: const EdgeInsets.only(left: 8.0),
                    onPressed: () {
                      if (kDebugMode) {
                        print("right");
                      }
                      // globalController.onClickMonth(1)
                    },
                    icon: const Icon(Icons.arrow_forward_ios,size: 14.0,)),
              ],
            ),
          ),
          Obx(() => Container(
              width: double.maxFinite, height: widget.height - toggleBtnHeight - monthHeight - 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildDateCardsWithKeys(CalendarUtil.endDateOfMonth(globalController.selectedDateTime.value)),
                ),
              )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(35.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0,5),
                    blurRadius: 3.0
                  )
                ]
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
