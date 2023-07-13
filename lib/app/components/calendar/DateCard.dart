import 'package:day_for_you/app/modules/app/controllers/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateCard extends StatelessWidget {
  DateCard({super.key, required this.date, required this.dateKey});

  int date;
  GlobalKey dateKey;

  @override
  Widget build(BuildContext context) {
    final appController = Get.put(AppController());
    return UnconstrainedBox(
      child: Obx(() => Container(
        key: dateKey,
          alignment: Alignment.center,
          height: 45, width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: appController.selectedDateTime.value.day == date ?
            Border.all(color: Color(0xffff84ce)) : Border(),),
          child: TextButton(
            onPressed: () {
              Scrollable.ensureVisible(dateKey.currentContext!);
              appController.onClickDate(date);
            },
            child: Text(
              date.toString(),
              style: TextStyle(
                fontSize: 18.0,
                color: appController.selectedDateTime.value.day == date ? Color(0xff000000) : Color(0xffCCCCCC)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
