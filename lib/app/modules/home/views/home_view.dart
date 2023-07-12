import 'package:day_for_you/app/components/calendar/ExpandedCalendar.dart';
import 'package:day_for_you/app/components/calendar/HomeCalendar.dart';
import 'package:day_for_you/app/components/calendar/ShrinkedCalendar.dart';
import 'package:day_for_you/app/modules/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeCalendar()
          ],
        ),
      ),
    );
  }
}
