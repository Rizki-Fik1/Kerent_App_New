import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/checkout_page/checkout_new.dart';
import 'package:kerent_app/home_page/NavigatorBottom.dart';
import 'package:kerent_app/home_page/loading_screen.dart';
import 'package:kerent_app/profile_page/profile_edit.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/home_page/search_resault.dart';
import 'package:kerent_app/home_page/inbox_page.dart';

class HomePage extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildSearchBar(),
            _buildCarousel(),
            _buildLatestItems(),
            _buildCategoryFilter(),
            _buildProdukList(context),
            _buildForYouSection(context),
          ],
          ),
        )
      ),
      currentIndex: 0,
    );
  }

Widget _buildHeader(BuildContext context) {
  final profileController = Get.put(ProfileAndRentalController());
  
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
              'Hai, ${profileController.username}!', 
              style: const TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.w800, 
                color: Color(0xffF8F8F8), 
                fontFamily: 'Plus Jakarta Sans'
              )
            )),
            const Opacity(
              opacity: 0.50,
              child: Text(
                'Siap untuk merental?', 
                style: TextStyle(
                  color: Color(0xffF8F8F8), 
                  fontSize: 13, 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontWeight: FontWeight.w600
                )
              ),
            )
          ],
        ),
        
        // Profile section
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const InboxPage(), transition: Transition.rightToLeft);
              },
              child: const Icon(
                Icons.notifications_sharp, // Ikon inbox
                color: Colors.white,
                size: 25, // Ukuran ikon
              ),
            ),
            const SizedBox(width: 16,),
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileEditView(), transition: Transition.rightToLeft);
              },
              child: Obx(() => Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8225),
                  shape: BoxShape.circle,
                  image: profileController.profileImage.value.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(profileController.profileImage.value),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: profileController.profileImage.value.isEmpty
                    ? Center(
                        child: Text(
                          profileController.username.value[0].toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : null,
              )),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildSearchBar() {
  final TextEditingController searchController = TextEditingController();

  return Obx(() => Column(
    children: [
      // Search Input
      Padding(
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
                  controller: searchController,
                  onChanged: controller.updateSearchQuery,
                    onFieldSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        // Clear focus before navigation
                        FocusScope.of(Get.context!).unfocus();
                        
                        // Navigate to search results page
                        Get.to(
                          () => const SearchResultsPage(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                        );
                        
                        // Update the search query in the controller
                        controller.updateSearchQuery(value);
                        controller.isSearching.value = true;
                      }
                    },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Search on Ke'rent",
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
      ),
      
      // Recommendations Panel
      if (controller.isSearching.value && controller.filteredRecommendations.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.96, -0.29),
                end: Alignment(-0.96, 0.29),
                colors: [
                  Color(0x99191919), 
                  Color(0x99282828),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.filteredRecommendations.length,
                    itemBuilder: (context, index) {
                      final recommendation = controller.filteredRecommendations[index];
                      return GestureDetector(
                          onTap: () {
                            // Navigate to search results when recommendation is tapped
                            Get.to(
                              () => const SearchResultsPage(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(milliseconds: 300),
                            );
                            
                            // Update the search query with the recommendation title
                            controller.updateSearchQuery(recommendation.title);
                            controller.isSearching.value = true;
                          },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0
                          ),
                          child: Row(
                            children: [
                              // Item Image
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(recommendation.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Item Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            recommendation.title,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        if (recommendation.isPopular)
                                          Container(
                                            margin: const EdgeInsets.only(left: 8),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFF8225),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'Popular',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Plus Jakarta Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          recommendation.price,
                                          style: const TextStyle(
                                            color: Color(0xFFAAAAAA),
                                            fontSize: 12,
                                            fontFamily: 'Plus Jakarta Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
    ],
  ));
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
                context,
                controller.banners[index].title,
                controller.banners[index].subtitle,
                controller.banners[index].image,
                controller.banners[index].color,
                index,
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

Widget _buildCarouselItem(BuildContext context, String title, String subtitle, String image, Color color, int index) {
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
                  Navigator.push(
                      context, 
                    MaterialPageRoute(
                      builder: (context) => CheckoutPage(produk: produk[index]),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffff101014),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: const Size(77, 28),
                ),
                child: const Text(
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
  
   const HomePage({super.key});

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
      color: const Color(0xFF31363F),
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Obx(() => ChoiceChip(
              label: Text(category),
              selected: controller.selectedCategory.value == category,
              onSelected: (selected) {
                if (selected) {
                  controller.selectCategory(category);
                }
              },
              backgroundColor: const Color(0xFF272829),
              selectedColor: const Color(0xFFFF8225),
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

Widget _buildForYouSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 16, top: 25, bottom: 16),
        child: Text(
          'For you',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Plus Jakarta Sans',
            color: Color(0xFFF8F8F8),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
            
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: controller.filteredProduk.length,
              itemBuilder: (context, index) {
                final item = controller.filteredProduk[index];
                return _buildForYouCard(context, item, constraints);
              },
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildForYouCard(BuildContext context, Produk product, BoxConstraints constraints) {
  // Hitung ukuran berdasarkan constraints
  final isSmallScreen = constraints.maxWidth < 400;
  final isMediumScreen = constraints.maxWidth < 600;
  
  // Responsive text sizes
  final titleFontSize = isSmallScreen ? 15.0 : (isMediumScreen ? 18.0 : 20.0);
  final priceFontSize = isSmallScreen ? 13.0 : (isMediumScreen ? 15.0 : 17.0);
  final ratingFontSize = isSmallScreen ? 11.0 : (isMediumScreen ? 12.0 : 13.0);

  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: const Color(0xFF31363F),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(produk: product),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(
                    product.images,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content section (Expanded flex: 2)
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 8.0 : 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.price,
                    style: TextStyle(
                      color: const Color(0xFFF8F8F8),
                      fontSize: priceFontSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: const Color(0xFFFF8225),
                        size: isSmallScreen ? 14 : 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: ratingFontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}