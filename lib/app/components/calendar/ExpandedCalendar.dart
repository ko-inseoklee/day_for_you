import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class ExpandedCalendar extends StatelessWidget {
  ExpandedCalendar({super.key, required this.height});

  final double height;
  final double toggleBtnHeight = 20;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Container(
      color: Colors.indigo,
      height: height,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite, height: height - toggleBtnHeight,
            child: Center(
              child: Text('전체 Calendar 들어갈 부분'),
            ),
          ),
          Container(
            width: double.maxFinite, height: toggleBtnHeight,
            color: Colors.cyan, alignment: Alignment.center,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: controller.toggleCalendarExpanded,
              icon: const Icon(Icons.arrow_drop_up),
            )
          )
        ],
      ),
    );
  }
}
