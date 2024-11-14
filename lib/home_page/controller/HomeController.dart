import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
    // Add profileImage as an observable
  final RxString _profileImage = ''.obs;
  String get profileImage => _profileImage.value;
  set profileImage(String value) => _profileImage.value = value;

  //Controller Category Item
  final RxList<String> categories = <String>['All', 'Laptop', 'Mouse', 'Keyboard', 'Phone'].obs;
  final RxList<Produk> filteredProduk = <Produk>[].obs;
  final Rx<String> selectedCategory = 'All'.obs; 
  
  final RxBool isSearching = false.obs;
  final RxString searchQuery = ''.obs;
  final RxList<SearchRecommendation> recommendations = <SearchRecommendation>[].obs;
  final RxList<SearchRecommendation> filteredRecommendations = <SearchRecommendation>[].obs;

void selectCategory(String category) {
  selectedCategory.value = category;
  if (category == 'All') {
    filteredProduk.assignAll(produk);
  } else {
    filteredProduk.assignAll(produk.where((p) => p.etalase == category).toList());
  }
  update(); // Notify the UI to update the search results
}

  //Controller Banner Item
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


    //Search Recommend
    final List<SearchRecommendation> _allRecommendations = [
    SearchRecommendation(
      title: 'Laptop 2 IN 1 NEC VersaPro',
      category: 'Laptop',
      image: 'lib/assets/Laptop kecil.png',
      price: 'Rp. 150.000 / Hari',
      isPopular: true,
    ),
    SearchRecommendation(
      title: 'Mouse Wireless Laptop 2.4Ghz',
      category: 'Mouse',
      image: 'lib/assets/mouse.png',
      price: 'Rp. 50.000 / Hari',
      isPopular: false,
    ),
      SearchRecommendation(
      title: 'Keyboard RGB',
      category: 'Keyboard',
      image: 'lib/assets/keyboard.png',
      price: 'Rp. 75.000 / Hari',
      isPopular: true,
    ),
  ];
  

  @override
  void onInit() {
    super.onInit();
    _startAutoScroll();
    filteredProduk.assignAll(produk);
    _profileImage.value = '';
    recommendations.assignAll(_allRecommendations);
    filteredRecommendations.assignAll(_allRecommendations);
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

    void updateSearchQuery(String query) {
    searchQuery.value = query;
    isSearching.value = query.isNotEmpty;
    
    if (query.isEmpty) {
      filteredRecommendations.assignAll(_allRecommendations);
    } else {
      filteredRecommendations.assignAll(_allRecommendations.where((recommendation) =>
          recommendation.title.toLowerCase().contains(query.toLowerCase()) ||
          recommendation.category.toLowerCase().contains(query.toLowerCase())));
    }
  }

    // Method to update profile image
  void updateProfileImage(String newImageUrl) {
    _profileImage.value = newImageUrl;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

    final List<Produk> produk = [
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 150.000 / Hari', images: 'lib/assets/Laptop kecil.png', rating: '4.3 (3) ', seller: 'DaffarelTech1', kelas: 'X PPLG 2', stock: '3', kondisi: 'Baru', etalase: 'Laptop',
    deskripsi: 'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop. ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.',
    
    ),
    Produk(name: 'Mouse Wireless Laptop', price: 'RP. 50.000 / Hari', images: 'lib/assets/mouse.png', rating: '4.3 (3) ', seller: 'DaffarelTech2', kelas: 'XI PPLG 3', stock: '3', kondisi: 'Bekas', etalase: 'Mouse',
    deskripsi: 'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.',
    
    ),
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 70.000 / Hari', images: 'lib/assets/Laptop kecil.png', rating: '4.3 (3) ', seller: 'DaffarelTech3', kelas: 'XII DKV 1', stock: '3', kondisi: 'Bekas', etalase: 'Laptop',
    deskripsi: 'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.',
    
    ), 
    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 500.000 / Hari', images: 'lib/assets/Laptop kecil.png', rating: '4.3 (3)', seller: 'DaffarelTech4', kelas: 'X TJKT 2', stock: '3', kondisi: 'Baru', etalase: 'Laptop',
    deskripsi: 'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.',
    
    ),

    Produk(name: 'Laptop 2 IN 1 NEC VersaPro', price: 'RP. 500.000 / Hari', images: 'lib/assets/Laptop kecil.png', rating: '4.3 (3) ', seller: 'DaffarelTech4', kelas: 'X TJKT 2', stock: '3', kondisi: 'Baru', etalase: 'Laptop',
    deskripsi: 'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktifitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.',
    
    ),
  ];

//Produk untuk card
class Produk {
  final String name;
  final String price;
  final String images;
  final String seller;
  final String kelas;
  final String kondisi;
  final String etalase;
  final String deskripsi;
  final String rating;
  final String stock;

  Produk({
    required this.name,
    required this.price,
    required this.images,
    required this.seller,
    required this.kelas,
    required this.kondisi,
    required this.etalase,
    required this.deskripsi,
    required this.rating,
    required this.stock,
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

//Recomended Search
class SearchRecommendation {
  final String title;
  final String category;
  final String image;
  final String price;
  final bool isPopular;

  SearchRecommendation({
    required this.title,
    required this.category,
    required this.image,
    required this.price,
    this.isPopular = false,
  });
}