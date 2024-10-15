import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final RxInt currentPage = 0.obs;

  final RxList<BannerItem> banners = <BannerItem>[
    BannerItem(
      title: 'Try renting\nsomething new',
      subtitle: 'Rent or leash your items',
      image: "lib/assets/keyboard banner.png",
      color: const Color(0xFFD4C4FC),
    ),
    BannerItem(
      title: 'Try renting\nsomething new',
      subtitle: 'Rent or leash your items',
      image: "lib/assets/Laptop Silver.png",
      color: const Color(0xFFFBC87B),
    ),
    BannerItem(
      title: 'Try renting\nsomething new',
      subtitle: 'Rent or leash your items',
      image: "lib/assets/Laptop kecil banner.png",
      color: const Color(0xFF597445)
    ),
    BannerItem(
      title: 'Try renting\nsomething new',
      subtitle: 'Rent or leash your items',
      image: "lib/assets/Iphone 16 PM banner.png",
      color: const Color.fromARGB(255, 123, 204, 251)
    ),
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
    Future.delayed(const Duration(seconds: 3), () {
      if (currentPage.value < banners.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
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

//Produk untuk card
class Produk {
  final String name;
  final String price;
  final String images;
  final String pricelist;
  final String seller;

  Produk({
    required this.name,
    required this.price,
    required this.images,
    required this.pricelist,
    required this.seller,
  });
}

//Banner
class BannerItem {
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  BannerItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });
}