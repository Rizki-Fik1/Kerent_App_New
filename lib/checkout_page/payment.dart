import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';

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
  
  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    classController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 48,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Pesanan Berhasil!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Request Pesanan mu telah masuk Inbox Penyewa.\nMohon tunggu penyewa membalas.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showConfirmationDialog() {
    if (selectedDuration == null || 
        nameController.text.isEmpty || 
        classController.text.isEmpty || 
        phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Informasi ini harus diisi'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Konfirmasi Pesanan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.grey[700]),
                SizedBox(height: 20),
                _buildDetailRow('Nama', nameController.text),
                SizedBox(height: 12),
                _buildDetailRow('Kelas', classController.text),
                SizedBox(height: 12),
                _buildDetailRow('No. Telepon', phoneController.text),
                SizedBox(height: 12),
                _buildDetailRow('Durasi Sewa', selectedDuration!),
                SizedBox(height: 12),
                _buildDetailRow('Total Harga', 'Rp ${totalPrice.toStringAsFixed(0)}'),
                SizedBox(height: 24),
                Text(
                  'Apakah informasi ini sudah benar?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(
                          'Batal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _showSuccessDialog();
                        },
                        child: Text(
                          'Konfirmasi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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

  Widget _buildTextField(String label, [bool isPhone = false]) {
    final controller = label == 'Name' 
        ? nameController 
        : label == 'Class' 
            ? classController 
            : phoneController;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        keyboardType: isPhone ? TextInputType.number : TextInputType.text,
        inputFormatters: isPhone ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          errorText: controller.text.isEmpty ? null : null, // Changed this line
        ),
        onChanged: (value) {
          setState(() {});
        },
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
        _buildTextField('Gopay account or Phone', true),
      ],
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
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _showConfirmationDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text('Rent Now'),
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