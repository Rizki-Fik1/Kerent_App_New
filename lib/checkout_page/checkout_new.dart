import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_image_carousel.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'payment.dart';
import 'package:kerent_app/home_page/NavigatorBottom.dart';
import 'package:kerent_app/profile_page/profile_public.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/chat_page/message.dart';

class CheckoutPage extends StatefulWidget {
  final Produk produk;
  final profileController = Get.put(ProfileAndRentalController());
  
  CheckoutPage({super.key, required this.produk}); 

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool _isExpanded = false;
  ElevatedButton? chatSellerButton;

  final List<String> imgList = [
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+1',
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+2',
    'https://via.placeholder.com/400x300/111111/FFFFFF/?text=Laptop+3',
  ];

  @override
  Widget build(BuildContext context) {
    chatSellerButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(
              recipientName: widget.produk.seller,
              profileColor: const Color(0xFFFF8225),
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFFFF8225),
        elevation: 0,
        side: const BorderSide(
          color: Color(0xFFFF8225),
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
      ),
      child: const Text(
        'Chat Seller',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Plus Jakarta Sans',
        ),
      ),
    );

    return CustomScaffold(
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
                      style: const TextStyle(
                        color: Color(0xFFF8F8F8),
                        fontSize: 16,
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          widget.produk.rating,
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.produk.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.class_, color: Colors.grey[400], size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Kelas: ${widget.produk.kelas}',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.production_quantity_limits, color: Colors.grey[400], size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Stock: ${widget.produk.stock}',
                          style: TextStyle(color: Colors.grey[400], fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => const PublicProfilePage(), arguments: widget.produk),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8225),
                            shape: BoxShape.circle,
                            image: widget.profileController.profileImage.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(widget.profileController.profileImage.value),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: widget.profileController.profileImage.value.isEmpty
                              ? Center(
                                  child: Text(
                                    widget.produk.seller[0].toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ), 
                        const SizedBox(width: 12),
                        Expanded(
                          child: InkWell( // Ganti GestureDetector dengan InkWell
                            onTap: () => Get.to(() => const PublicProfilePage(), arguments: widget.produk),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.produk.seller,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Plus Jakarta Sans',
                                  ),
                                ),
                                const Text(
                                  'Aktif 2 jam yang lalu',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontFamily: 'Plus Jakarta Sans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        chatSellerButton!,
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoSection('Kondisi: ', widget.produk.kondisi),
                    _buildInfoSection('Etalase', widget.produk.etalase),
                    _buildInfoSection('Deskripsi Produk', widget.produk.deskripsi),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => RentalPage(produk: widget.produk),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Rent Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      currentIndex: -1,
    );
  }

  Widget _buildInfoSection(String title, String content) {
    const int wordLimit = 50;
    List<String> words = content.split(' ');

    String displayedText = _isExpanded || words.length <= wordLimit
        ? content
        : '${words.take(wordLimit).join(' ')}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            text: displayedText,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w600            
            ),
            children: [
              if (words.length > wordLimit)
                TextSpan(
                  text: _isExpanded ? ' Lihat lebih sedikit' : ' \nLihat selengkapnya',
                  style: const TextStyle(
                    color: Colors.blue
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}