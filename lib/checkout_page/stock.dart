import 'package:flutter/material.dart';
import 'package:kerent_app/checkout_page/chcekout.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/checkout_page/price_module.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/home_page/cobahome.dart';

class StockPage extends StatelessWidget {
  final Produk produk;

  const StockPage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF31363F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Image.asset(produk.images),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produk.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF8F8F8),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      produk.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFF8F8F8),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
 Opacity(
  opacity: 0.80,
  child: Container(
    width: 260,
    height: 60,
    decoration: ShapeDecoration(
      color: Color(0xFFD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
    ),
    child: Opacity(
  opacity: 0.80,
  child: Container(
    width: 260,
    height: 54,
    decoration: BoxDecoration(
      color: Color(0xFFD9D9D9),
      borderRadius: BorderRadius.circular(9),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Durasi Sewa',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 3), 
              Text(
                '1 Hari',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Harga',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 3), 
              Text(
                'Rp 150.000',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
)

  ),
),
    ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(produk: produk),
                  ),
                );
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    )
        );
  }
}
