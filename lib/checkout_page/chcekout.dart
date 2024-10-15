import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';

class CheckoutPage extends StatelessWidget {
  final Produk produk;

  CheckoutPage({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(produk.images, height: 200),
            SizedBox(height: 20),
            Text('Product: ${produk.name}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text('Total Price: Rp. ${produk.price}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Choose Payment Method:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Gopay'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Dana'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cash'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic for completing the checkout
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Checkout Completed!')),
                );
              },
              child: Text('Complete Purchase'),
            ),
          ],
        ),
      ),
    );
  }
}
