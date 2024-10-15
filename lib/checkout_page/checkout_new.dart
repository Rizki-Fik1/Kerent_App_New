import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'product_image_carousel.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';

class CheckoutPage extends StatefulWidget {
  final Produk produk;  // Produk harus dideklarasikan dengan benar

  CheckoutPage({required this.produk}); 

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _isExpanded = false; // State untuk menentukan apakah teks diperluas atau tidak

  final List<String> imgList = [
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+1',
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+2',
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageCarousel(imgList: imgList),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.produk.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.0 (10 Ratings)',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.produk.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey[400], size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Jakarta Selatan',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.grey[400], size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Selle ${widget.produk.seller}',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),
                    _buildInfoSection('Kondisi', 'Bekas'),
                    _buildInfoSection('Etalase', 'Laptop'),
                    _buildInfoSection('Deskripsi Produk', 
                      'ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktivitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop. ADVAN T-BOOK Memiliki desain yang minimalis dan kekinian. Laptop ini ditenagai prosesor Intel N100 yang dapat memenuhi kebutuhan pengguna dalam mendukung produktivitas sehari-hari. \n\nAdvan Laptop TBook memiliki kapasitas baterai 45.6Wh. Dengan kapasitas baterai yang besar membuat pemakaian perangkat lebih lama tanpa perlu khawatir terlalu sering mengisi daya baterai laptop.'
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Check Out'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Method untuk membangun bagian informasi dengan fitur "Lihat Selengkapnya"
  Widget _buildInfoSection(String title, String content) {
    final int wordLimit = 50; // Batas jumlah kata
    List<String> words = content.split(' '); // Memisahkan konten menjadi list kata

    String displayedText = _isExpanded || words.length <= wordLimit
        ? content
        : words.take(wordLimit).join(' ') + '...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            text: displayedText,
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
            children: [
              if (words.length > wordLimit)
                TextSpan(
                  text: _isExpanded ? ' Lihat lebih sedikit' : ' \nLihat selengkapnya',
                  style: TextStyle(
                    color: Colors.blue
                    ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _isExpanded = !_isExpanded; // Toggle state saat ditekan
                      });
                    },
                ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  // Bottom navigation bar
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
            transform: Matrix4.translationValues(0, -20, 0),
            child: ElevatedButton(
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
