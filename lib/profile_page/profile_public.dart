// profile_public.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/chat_page/chat.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/profile_page/Followers_page.dart';
import 'package:kerent_app/profile_page/Following_page.dart';

class PublicProfilePage extends StatelessWidget {
  final ProfileAndRentalController profileController = Get.put(ProfileAndRentalController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildProfileInfo(
                profileController.profileImage.value,
                profileController.username.value,
                profileController.classOrPosition.value,
                profileController.description.value,
              ),
              _buildTabBar(),
              _buildTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

Widget _buildProfileInfo(String profileImage, String username, String classOrPosition, String description) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildProfilePicture(profileImage, username),
            const SizedBox(height: 50),
            SizedBox(
              width: 80,
              height: 38, // Sama dengan lebar foto profile
              child: Obx(() => ElevatedButton(
                onPressed: () => profileController.toggleFollow(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: profileController.isFollowing.value
                      ? Colors.grey[800]
                      : const Color.fromARGB(255, 37, 200, 255),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    profileController.isFollowing.value ? 'Mengikuti' : 'Ikuti',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              )),
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: _buildProfileDetails(username, classOrPosition, description),
        ),
      ],
    ),
  );
}

  Widget _buildProfilePicture(String profileImage, String username) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFFF8225),
        shape: BoxShape.circle,
        image: profileImage.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(profileImage),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: profileImage.isEmpty
          ? Center(
              child: Text(
                username[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }

Widget _buildProfileDetails(String username, String classOrPosition, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        username,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Plus Jakarta Sans',
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 4.0),
      Text(
        classOrPosition,
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
          fontFamily: 'Plus Jakarta Sans',
        ),
      ),
      const SizedBox(height: 8.0),
      Text(
        description,
        style: const TextStyle(
          fontSize: 14.0,
          fontFamily: 'Plus Jakarta Sans',
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 8.0),
      Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => FollowersPage()),
            child: Obx(() => Text(
              '${profileController.followersCount} Pengikut',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14,
              ),
            )),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => Get.to(() => FollowingPage()),
            child: Obx(() => Text(
              '${profileController.followingCount} Mengikuti',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14,
              ),
            )),
          ),
        ],
      ),
      const SizedBox(height: 16.0),
      // Chat seller button dengan lebar penuh
      ElevatedButton(
        onPressed: () => Get.to(() => ChatListPage()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF8225),
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Chat seller',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: TabBar(
        labelColor: const Color(0xFFFF8225),
        unselectedLabelColor: Colors.grey,
        indicatorColor: const Color(0xFFFF8225),
        labelStyle: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        tabs: const [
          Tab(text: 'History Rental'),
          Tab(text: 'Barang Disewakan'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildHistoryRentalGrid(),
          _buildBarangDisewakanGrid(),
        ],
      ),
    );
  }

  Widget _buildHistoryRentalGrid() {
    return Obx(() => GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: profileController.historyItems.length,
      itemBuilder: (context, index) {
        final item = profileController.historyItems[index];
        return _buildHistoryProductCard(
          item['itemName'],
          item['price'],
          item['imageUrl'],
          item['status'],
          item['rentalDate'],
          item['returnDate'],
        );
      },
    ));
  }

    Widget _buildHistoryProductCard(String name, String price, String imageUrl, String status, String rentalDate, String returnDate) {
  return SizedBox(
    height: 250,
    child: Card(
      elevation: 0,
      color: const Color(0xFF31363F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black26,
                ),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/placeholder.png',
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFF8F8F8),
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFF8F8F8),
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tanggal Sewa: ${rentalDate}', // Menampilkan status
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFF8F8F8),
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
              Text(
              'Tanggal Pengembalian: ${returnDate}', // Menampilkan status
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFF8F8F8),
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Status: ${status}', // Menampilkan status
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
  );
}

  Widget _buildBarangDisewakanGrid() {
    return Obx(() => GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: profileController.rentedItems.length,
      itemBuilder: (context, index) {
        final item = profileController.rentedItems[index];
        return _buildProductCard(
          item['name'],
          item['price'],
          item['imageUrl'],
        );
      },
    ));
  }

  Widget _buildProductCard(String name, String price, String imageUrl) {
    return SizedBox(
      height: 250,
      child: Card(
        elevation: 0,
        color: const Color(0xFF31363F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black26,
                  ),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/placeholder.png',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF8F8F8),
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.normal, 
                  color: Color(0xFFF8F8F8), 
                  fontFamily: 'Plus Jakarta Sans', 
                  fontSize: 10
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}