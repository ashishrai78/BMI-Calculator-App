
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MoreTipsScreenController extends GetxController {
  static MoreTipsScreenController get instance => Get.find();

  //variables
  final pageController = PageController();
  RxInt currentIndex = 0.obs;

  // Update By PageScroll
  void upDateByPageScroll(index) {
    currentIndex.value = index;
  }

  // Update By SmoothPageIndicator
  void upDateBySmoothPageIndicator(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

}