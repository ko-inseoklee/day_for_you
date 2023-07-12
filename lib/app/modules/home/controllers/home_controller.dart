import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  Rx<bool> isCalendarExpanded = false.obs;

  @override
  void onInit() {
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

  void increment() => count.value++;

  void toggleCalendarExpanded () {
    isCalendarExpanded(!isCalendarExpanded.value);

    if (kDebugMode) {
      print(isCalendarExpanded.value);
    }
  }
}
