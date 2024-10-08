import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';

class HomePage extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCarousel(),
            _buildLatestItems(),
          ],
          ),
        )
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.only(top: 20),
                height: 53,
                decoration: BoxDecoration(
                  color: Color(0xFF272829),
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
                      margin: EdgeInsets.only(left: 20),
                      width: 250,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
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
          padding: EdgeInsets.only(top: 10),
        child: Container(
          height: 200,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.banners.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return _buildCarouselItem(
                controller.banners[index].title,
                controller.banners[index].subtitle,
              );
            },
          ),
        ),
    ),
        SizedBox(height: 10),
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

Widget _buildCarouselItem(String title, String subtitle) {
  return Card(
    margin: EdgeInsets.all(16),
    color: Color(0xffD4C4FC),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF101014),
                      fontFamily: 'Plus Jakarta Sans',
                    )),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF101014),
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 3),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Rent Now',
                  style: TextStyle(
                    color: Color(0xFFF8F8F8),
                    fontSize: 10,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFF101014),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: Size(77, 28),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'lib/assets/Laptop Silver.png',
              fit: BoxFit.cover,
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
      margin: EdgeInsets.symmetric(horizontal: 4),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', color: Color(0xFFF8F8F8),)),
              Text('Show All', style: TextStyle(color: Color(0xFF31363F), fontSize: 11, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700,)),
            ],
          ),
        ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildLatestItemCard1('Laptop 2 IN 1 NEC VersaPro', 'Rp 10.000 / Hari'),
            _buildLatestItemCard2('Mouse Wireless Laptop 2.4Ghz', 'Rp 5.000 / Hari'),
            _buildLatestItemCard3('Keyboard Mechanical RGB', 'Rp 8.000 / Hari'),
            _buildLatestItemCard4('Iphone 16 Pro Max', 'Rp 12.000 / Hari'),
          ],
        ),
      ),
      ],
    );
  }

    Widget _buildLatestItemCard1(String title, String price) => Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 153,
              height: 133,
              decoration: ShapeDecoration(
              color: Color(0xFF31363F),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              ),
            ),
              child: Image.asset('lib/assets/Laptop kecil.png'),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    );

    Widget _buildLatestItemCard2(String title, String price) => Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 153,
              height: 133,
              decoration: ShapeDecoration(
              color: Color(0xFF31363F),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              ),
            ),
              child: Image.asset('lib/assets/mouse.png'),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    );

    Widget _buildLatestItemCard3(String title, String price) => Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 153,
              height: 133,
              decoration: ShapeDecoration(
              color: Color(0xFF31363F),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              ),
            ),
              child: Image.asset('lib/assets/keyboard.png'),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    );

    Widget _buildLatestItemCard4(String title, String price) => Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 153,
              height: 133,
              decoration: ShapeDecoration(
              color: Color(0xFF31363F),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              ),
            ),
              child: Image.asset('lib/assets/Iphone 16 PM.png'),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    );

//Navigator Button
Widget _buildBottomNavBar() {
  return BottomAppBar(
    color: Color(0xFF191919),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF191919),
            shadowColor: Colors.transparent,
          ),
          onPressed: (){}, 
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.home, size: 35, color: Colors.white),
            Text('Home', style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600,)),
          ],
        ),
      ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF191919),
            shadowColor: Colors.transparent,
          ),
          onPressed: (){}, 
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add_circle, size: 45, color: Colors.orange),
          ],
        ),
      ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF191919),
            shadowColor: Colors.transparent,
          ),
          onPressed: (){}, 
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat, size: 35, color: Colors.white),
            Text('Chat', style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600,)),
          ],
        ),
      )

      ],
    ),
  );
}

}