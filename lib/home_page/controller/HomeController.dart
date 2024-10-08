import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final RxInt currentPage = 0.obs;
  final RxList<BannerItem> banners = <BannerItem>[
    BannerItem('Try renting\nsomething new', 'Rent or leash your items'),
    BannerItem('Try renting\nsomething new', 'Rent or leash your items'),
    BannerItem('Try renting\nsomething new', 'Rent or leash your items'),
    BannerItem('Try renting\nsomething new', 'Rent or leash your items'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (currentPage.value < banners.length - 1) {
        pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
      _startAutoScroll();
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class BannerItem {
  final String title;
  final String subtitle;

  BannerItem(this.title, this.subtitle);
}