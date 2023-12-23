import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootViewController extends GetxController {
  late PageController pageController;
  var selectedPage = Rx<int>(0);

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void changeScreen(int index) {
    selectedPage.value = index;
    pageController.jumpToPage(index);
  }

  void animateToTab(int page) {
    selectedPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
