import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/home_page/cobahome.dart';

class RentalPage extends StatefulWidget {
  final Produk produk;

  const RentalPage({super.key, required this.produk});

  @override
  _RentalPageState createState() => _RentalPageState();
}

class _RentalPageState extends State<RentalPage> {
  String? selectedDuration;
  final List<String> durations = ['1 Day', '3 Days', '7 Days', '30 Days'];
  double totalPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductCard(),
              SizedBox(height: 16),
              _buildForm(),
              SizedBox(height: 16),
              _buildTotalPrice(),
              SizedBox(height: 16),
              _buildRentButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard() {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: ShapeDecoration(
                color: const Color(0xFF31363F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Image.asset(widget.produk.images),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produk.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF8F8F8),
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.produk.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFF8F8F8),
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rental Duration',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        _buildDropdownField(),
        SizedBox(height: 16),
        _buildTextField('Name'),
        SizedBox(height: 8),
        _buildTextField('Class'),
        SizedBox(height: 8),
        _buildTextField('Gopay account or Phone'),
      ],
    );
  }

  Widget _buildDropdownField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text('Select Duration', style: TextStyle(color: Colors.white70)),
          value: selectedDuration,
          items: durations.map((duration) {
            return DropdownMenuItem<String>(
              value: duration,
              child: Text(duration, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedDuration = value;
              _calculateTotalPrice();
            });
          },
          icon: Icon(Icons.arrow_drop_down, color: Colors.white70),
          dropdownColor: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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

  Widget _buildTotalPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Price',
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          'Rp ${totalPrice.toStringAsFixed(0)} / Duration',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
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
        onPressed: () {
          // Implement rent logic here
        },
      ),
    );
  }

  void _calculateTotalPrice() {
    switch (selectedDuration) {
      case '1 Day':
        totalPrice = 150000;
        break;
      case '3 Days':
        totalPrice = 400000;
        break;
      case '7 Days':
        totalPrice = 800000;
        break;
      case '30 Days':
        totalPrice = 3000000;
        break;
      default:
        totalPrice = 0.0;
    }
  }
}