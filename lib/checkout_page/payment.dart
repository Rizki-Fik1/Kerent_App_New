import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/home_page/cobahome.dart';

class RentalPage extends StatelessWidget {
  final Produk produk;

   const RentalPage({super.key, required this.produk});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProductCard(),
            SizedBox(height: 16),
            _buildForm(),
            Spacer(),
            _buildRentButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Card(
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
            );
  }

  Widget _buildForm() {
    return Column(
      children: [
        _buildDropdownField('Durasi Sewa'),
        _buildTextField('Nama'),
        _buildTextField('Kelas'),
        _buildTextField('Gopay account or Phone'),
      ],
    );
  }

  Widget _buildDropdownField(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(label, style: TextStyle(color: Colors.white70)),
          items: [],
          onChanged: (value) {},
          icon: Icon(Icons.arrow_drop_down, color: Colors.white70),
          dropdownColor: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildRentButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text('Rent Now'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}