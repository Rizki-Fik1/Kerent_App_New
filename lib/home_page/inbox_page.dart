import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/chat_page/message.dart';

// Add Product class if it's not already defined elsewhere
class Product {
  final String name;
  final String images;
  final int price;
  // Add other necessary properties

  Product({
    required this.name,
    required this.images,
    required this.price,
  });
}

// Add RentRequest class definition
class RentRequest {
  final Product product;
  final String customerName;
  final String rentalDuration;
  final String customerClass;
  final String customerGopayOrPhone;
  final int totalPrice;
  String status;

  RentRequest({
    required this.product,
    required this.customerName,
    required this.rentalDuration,
    required this.customerClass,
    required this.customerGopayOrPhone,
    required this.totalPrice,
    required this.status,
  });
}

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final _rentRequests = <RentRequest>[];

  @override
  void initState() {
    super.initState();
    _loadRentRequests();
  }

  void _loadRentRequests() {
    // Create sample products
    final sampleProducts = [
      Product(
        name: 'Camera Sony A7',
        images: 'lib/assets/Laptop kecil.png', // Update with your actual image path
        price: 200000,
      ),
      Product(
        name: 'DJI Drone',
        images: 'assets/images/drone.jpg', // Update with your actual image path
        price: 150000,
      ),
    ];

    // Simulasi data permintaan rental dari penjual
    _rentRequests.add(
      RentRequest(
        product: sampleProducts[0],
        customerName: 'Hilmi Adli',
        rentalDuration: '3 Hari',
        customerClass: 'XI PPLG 2',
        customerGopayOrPhone: '083837230205',
        totalPrice: 400000,
        status: 'Pending',
      ),
    );
    _rentRequests.add(
      RentRequest(
        product: sampleProducts[1],
        customerName: 'Faezya',
        rentalDuration: '7 Hari',
        customerClass: 'XII DKV 1',
        customerGopayOrPhone: '082198765432',
        totalPrice: 800000,
        status: 'Confirmed',
      ),
    );
  }

void _navigateToMessage(RentRequest request, String message) {
    Get.to(() => MessagePage(
      recipientName: request.customerName,
      profileColor: Colors.orange,
      initialMessage: message,
      rentRequest: request,
    ));
  }

  void _handleRentRequest(RentRequest request, bool isConfirmed) {
    setState(() {
      request.status = isConfirmed ? 'Confirmed' : 'Rejected';
    });

    if (isConfirmed) {
      _navigateToMessage(
        request,
        "Hi, ${request.customerName}, pesananmu yang ini diterima nih. Mau ketemuan kapan dan dimana",
      );
    } else {
      _showRejectionDialog(request);
    }
  }

  void _showRejectionDialog(RentRequest request) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF262626),
        title: const Text(
          'Alasan Penolakan',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Masukkan alasan penolakan',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateToMessage(
                request,
                "Hi, ${request.customerName}, maaf pesananmu kami batalkan karena ${controller.text}.",
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.orange,
            ),
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF262626),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _rentRequests.length,
        itemBuilder: (context, index) {
          final request = _rentRequests[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        request.product.images,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request.product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF8F8F8),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildInfoRow('Duration', request.rentalDuration),
                        _buildInfoRow('Name', request.customerName),
                        _buildInfoRow('Class', request.customerClass),
                        _buildInfoRow('Contact', request.customerGopayOrPhone),
                        const SizedBox(height: 8),
                        Text(
                          'Total Price: Rp ${request.totalPrice} / Duration',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFF8F8F8),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildStatusBadge(request.status),
                        if (request.status == 'Pending')
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _buildActionButton(
                                  'Confirm',
                                  Colors.green,
                                  () => _handleRentRequest(request, true),
                                ),
                                const SizedBox(width: 8),
                                _buildActionButton(
                                  'Reject',
                                  Colors.red,
                                  () => _handleRentRequest(request, false),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '$label: $value',
        style: const TextStyle(
          color: Color(0xFFB0B0B0),
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final Color backgroundColor;
    final Color textColor;

    switch (status) {
      case 'Pending':
        backgroundColor = Colors.orange.withOpacity(0.2);
        textColor = Colors.orange;
        break;
      case 'Confirmed':
        backgroundColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.red.withOpacity(0.2);
        textColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Status: $status',
        style: TextStyle(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }
}