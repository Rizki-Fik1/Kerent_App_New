import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/checkout_page/checkout_new.dart';
import 'package:kerent_app/chat_page/chat.dart';
import 'package:kerent_app/home_page/controller/Hover.dart';
import 'package:kerent_app/home_page/add-product.dart';
import 'package:kerent_app/home_page/NavigatorBottom.dart';

class HomePage extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCarousel(),
            _buildLatestItems(),
            _buildCategoryFilter(),
            _buildProdukList(context),
          ],
          ),
        )
      ),
      currentIndex: 0,
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hai, Qiqi!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xffF8F8F8), fontFamily: 'Plus Jakarta Sans',)),
              Opacity(
                opacity: 0.50,
                child: Text('Siap untuk merental?', style: TextStyle(color: Color(0xffF8F8F8), fontSize: 13, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600,)),)
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(top: 20),
                height: 53,
                decoration: BoxDecoration(
                  color: const Color(0xFF272829),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 22,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 250,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Search on Ke’rent",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Color(0xFFF8F8F8),
                            fontSize: 13,
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

//Banner Style
Widget _buildCarousel() {
    return Obx(() => Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.banners.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return _buildCarouselItem(
                controller.banners[index].title,
                controller.banners[index].subtitle,
                controller.banners[index].image,
                controller.banners[index].color,
              );
            },
          ),
        ),
    ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.banners.length,
            (index) => _buildDotIndicator(index),
          ),
        ),
      ],
    )
  );
 }

Widget _buildCarouselItem(String title, String subtitle, String image, Color color) {
  return Card(
    margin: const EdgeInsets.all(16),
    color: color,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 5),
                child: Text(title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF101014),
                      fontFamily: 'Plus Jakarta Sans',
                    )),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF101014),
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffff101014),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(77, 28),
                ),
                child: Text(
                  'Rent Now',
                  style: TextStyle(
                    color: Color(0xFFF8F8F8),
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              image
            ),
          ),
        ],
      ),
    ),
  );
}


  //Indikator Banner
  Widget _buildDotIndicator(int index) {
    return Obx(() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: controller.currentPage.value == index
            ? Colors.white
            : Colors.grey,
      ),
    ));
  }

  

  Widget _buildLatestItems() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category Item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', color: Color(0xFFF8F8F8),)),
            ],
          ),
        ),
      ],
    );
  }
  
   HomePage({super.key});

Widget _buildProdukList(BuildContext context) {
  return Obx(() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(controller.filteredProduk.length, (index) {
        final item = controller.filteredProduk[index];
        return _buildProduk(context, item.name, item.price, item.images, index);
      }),
    ),
  ));
}
    
    Widget _buildProduk(BuildContext context, String name, String price, String images, int index) => 
    GestureDetector(
     onTap:() {
      Navigator.push(
        context, 
        MaterialPageRoute(
      builder: (context) => CheckoutPage(produk: produk[index]),
    ),
  );
     },
      child: Card(
      color: Color(0xFF31363F),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 153,
              height: 133,
              decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              ),
            ),
              child: Image.asset(images),
            ),
            const SizedBox(height: 8),

            Text(name, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: const TextStyle(fontWeight: FontWeight.normal, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    )
    );

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Obx(() => ChoiceChip(
              label: Text(category),
              selected: controller.selectedCategory.value == category,
              onSelected: (selected) {
                if (selected) {
                  controller.selectCategory(category);
                }
              },
              backgroundColor: Color(0xFF272829),
              selectedColor: Color(0xFFFF8225),
              labelStyle: TextStyle(
                color: controller.selectedCategory.value == category
                    ? Colors.white
                    : Colors.grey,
              ),
            )),
          );
        },
      )),
    );
  }
}