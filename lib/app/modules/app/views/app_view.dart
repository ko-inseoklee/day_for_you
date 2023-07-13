import 'package:day_for_you/app/modules/community/views/community_view.dart';
import 'package:day_for_you/app/modules/home/views/home_view.dart';
import 'package:day_for_you/app/modules/report/views/report_view.dart';
import 'package:day_for_you/app/modules/routine/views/routine_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  const AppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          body: Container(
            padding: const EdgeInsets.only(top: 60.0),
            color: Colors.white,
            child: IndexedStack(
              index: controller.pageIdx.value,
              children: const [
                HomeView(),
                ReportView(),
                RoutineView(),
                CommunityView()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            key: controller.navigationKey,
            onTap: controller.changeBottomNav,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.pageIdx.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: "Report",
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.manage_history),
              label: "Routine",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard_outlined),
              label: "Community",
            ),
            ],
          ),
        ),
      ),
      onWillPop: () => controller.willPopAction(),
    );
  }
}
