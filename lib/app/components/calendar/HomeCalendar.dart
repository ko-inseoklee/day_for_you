import 'package:day_for_you/app/components/calendar/ExpandedCalendar.dart';
import 'package:day_for_you/app/components/calendar/ShrinkedCalendar.dart';
import 'package:day_for_you/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeCalendar extends StatelessWidget {
  HomeCalendar({Key? key}) : super(key: key);

  var shrinkedHeight = 115.0.obs;

  var expandedHeight = 300.0.obs;

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: controller.isCalendarExpanded.value ? expandedHeight.value : shrinkedHeight.value,
            child: SingleChildScrollView(
              child: controller.isCalendarExpanded.value ?
              ExpandedCalendar( height: expandedHeight.value ) :
              ShrinkedCalendar( height: shrinkedHeight.value ),
            )
          ),
        ),
      ],
    );
  }
}
