import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileAndRentalController controller = Get.find();
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Mengikuti',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.following.length,
        itemBuilder: (context, index) {
          final following = controller.following[index];
          return _buildFollowListItem(following);
        },
      )),
    );
  }

  Widget _buildFollowListItem(Map<String, dynamic> user) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFFFF8225),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            user['username'][0].toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(
        user['username'],
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user['classOrPosition'],
        style: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Plus Jakarta Sans',
        ),
      ),
    );
  }
}