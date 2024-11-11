import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';

class FollowersPage extends StatelessWidget {
  final ProfileAndRentalController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Pengikut',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.followers.length,
        itemBuilder: (context, index) {
          final follower = controller.followers[index];
          return _buildFollowListItem(follower);
        },
      )),
    );
  }

  Widget _buildFollowListItem(Map<String, dynamic> user) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFFF8225),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            user['username'][0].toUpperCase(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(
        user['username'],
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        user['classOrPosition'],
        style: TextStyle(
          color: Colors.grey,
          fontFamily: 'Plus Jakarta Sans',
        ),
      ),
    );
  }
}