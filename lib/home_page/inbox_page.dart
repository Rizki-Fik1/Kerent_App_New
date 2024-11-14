import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:kerent_app/chat_page/message.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final Homecontroller _homeController = Get.find();
  final _rentRequests = <RentRequest>[];

  @override
  void initState() {
    super.initState();
    _loadRentRequests();
  }

  void _loadRentRequests() {
    // Simulasi data permintaan rental dari penjual
    _rentRequests.add(
      RentRequest(
        product: produk[0],
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
        product: produk[1],
        customerName: 'Faezya',
        rentalDuration: '7 Hari',
        customerClass: 'XII DKV 1',
        customerGopayOrPhone: '082198765432',
        totalPrice: 800000,
        status: 'Confirmed',
      ),
    );
  }

  void _handleRentRequest(RentRequest request, bool isConfirmed) {
    setState(() {
      request.status = isConfirmed ? 'Confirmed' : 'Rejected';
    });

    if (isConfirmed) {
      Get.to(() => MessagePage(
            recipientName: request.customerName,
            profileColor: Colors.orange,
            initialMessage: "Hi, ${request.customerName}, pesananmu yang ini diterima nih. Mau ketemuan kapan dan dimana",
          ));
    } else {
      _showRejectionDialog(request.customerName);
    }
  }

  void _showRejectionDialog(String customerName) {
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
          decoration: InputDecoration(
            hintText: 'Masukkan alasan penolakan',
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Get.to(() => MessagePage(
                    recipientName: customerName,
                    profileColor: Colors.orange,
                    initialMessage: "Hi, $customerName, maaf pesananmu kami batalkan karena ${controller.text}.",
                  ));
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(0, 2),
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
                    child: Image.asset(request.product.images),
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
                        Text(
                          'Rental Duration: ${request.rentalDuration}',
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Name: ${request.customerName}',
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Class: ${request.customerClass}',
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Gopay/Phone: ${request.customerGopayOrPhone}',
                          style: const TextStyle(
                            color: Color(0xFFB0B0B0),
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                          ),
                        ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: request.status == 'Pending'
                                ? Colors.orange.withOpacity(0.2)
                                : request.status == 'Confirmed'
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Status: ${request.status}',
                            style: TextStyle(
                              color: request.status == 'Pending'
                                  ? Colors.orange
                                  : request.status == 'Confirmed'
                                      ? Colors.green
                                      : Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (request.status == 'Pending')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () => _handleRentRequest(request, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Confirm'),
                              ),
                              const SizedBox(width: 6),
                              ElevatedButton(
                                onPressed: () => _handleRentRequest(request, false),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text('Reject'),
                              ),
                            ],
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
}

class RentRequest {
  final Produk product;
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