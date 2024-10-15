import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/checkout_page/checkout_new.dart';

class HomePage extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildCarousel(),
            _buildLatestItems(),
            _buildProdukList(context),
          ],
          ),
        )
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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
                      fontWeight: FontWeight.w700,
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
                    fontWeight: FontWeight.w600,
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
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Item', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Plus Jakarta Sans', color: Color(0xFFF8F8F8),)),
              Text('Show All', style: TextStyle(color: Color(0xFF31363F), fontSize: 11, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w700,)),
            ],
          ),
        ),
      ],
    );
  }

    final List<Produk> produk = [
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 150.000 / Hari', images: 'lib/assets/Laptop kecil.png', pricelist: '150.000 /Hari', seller: 'DaffarelTech1' ),
    Produk(name: 'Mouse Wireless Laptop', price: 'RP. 50.000 / Hari', images: 'lib/assets/mouse.png', pricelist: '1: 50.000, 2: 80.000, 3: 100.000', seller: 'DaffarelTech2'),
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 70.000 / Hari', images: 'lib/assets/Laptop kecil.png', pricelist: '1: 150.000, 2: 280.000, 3: 400.000', seller: 'DaffarelTech3'), 
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 500.000 / Hari', images: 'lib/assets/Laptop kecil.png', pricelist: '1: 150.000, 2: 280.000, 3: 400.000', seller: 'DaffarelTech4'),
  ];

   HomePage({super.key});

Widget _buildProdukList(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(produk.length, (index) {
        final item = produk[index];
        return _buildProduk(context,item.name, item.price, item.images, index);
      }),
    ),
  );
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

            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 12)),
            Text(price, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFFF8F8F8), fontFamily: 'Plus Jakarta Sans', fontSize: 10)),
          ],
        ),
      ),
    )
    );


//Navigator Button
Widget _buildBottomNavBar() {
  return BottomAppBar(
    color: const Color(0xFF191919),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            overlayColor: Colors.transparent,
          ),
          onPressed: (){}, 
          child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.home, size: 35, color: Colors.white),
            Text('Home', style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Plus Jakarta Sans', fontWeight: FontWeight.w600,)),
          ],
        ),
      ),

      Transform(
        transform: 
        Matrix4.translationValues(0, -20, 0),
        child:  ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            minimumSize: const Size(90, 58.96),
            padding: EdgeInsets.zero,
            elevation: 0,
            overlayColor: Colors.transparent,
          ),
          onPressed: () {}, 
            child: Container(
              width: 58.96,
              height: 58.96,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFFFF8225), Color(0xFFB43F3F)],
                ),
                shape: OvalBorder(),
                shadows: [
                  BoxShadow(
                    color: Color(0xFFFFFFFF),
                    blurRadius: 0,
                    offset: Offset(0, 0),
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: Color(0x4CB43F3F),
                    blurRadius: 0,
                    offset: Offset(0, 0),
                    spreadRadius: 5,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('lib/assets/plus_icon.png'),
                ),
              ),
            ),
        ), 
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            overlayColor: Colors.transparent,
          ),
          onPressed: (){}, 
          child: const Column(
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