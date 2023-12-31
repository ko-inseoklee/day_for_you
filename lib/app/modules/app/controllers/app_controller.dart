import 'package:day_for_you/app/data/models/Properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AppController extends GetxController {

  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  RxInt pageIdx = 0.obs;

  final Rx<Properties> _properties = Properties().obs;

  Rx<DateTime> selectedDateTime = DateTime.now().obs;

  void onClickDate (int date) => selectedDateTime(DateTime.utc(
    selectedDateTime.value.year,
    selectedDateTime.value.month,
    date
  ));

  void onClickMonth (int interval) => selectedDateTime(DateTime.utc(
    selectedDateTime.value.year,
    selectedDateTime.value.month + interval,
    1
  ));

  void changeBottomNav(int value, {bool hasGesture = true}) {
    if (kDebugMode) {
      print(value);
    }
    pageIdx(value);
   }

  @override
  void onInit() {
    selectedDateTime(_properties.value.serverDateTime);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> willPopAction () => Future(() => false);
}
