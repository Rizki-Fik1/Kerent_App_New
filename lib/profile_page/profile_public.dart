import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/chat_page/message.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/profile_page/Followers_page.dart';
import 'package:kerent_app/profile_page/Following_page.dart';

class PublicProfilePage extends StatefulWidget {
  const PublicProfilePage({super.key});

  @override
  State<PublicProfilePage> createState() => _PublicProfilePageState();
}

class _PublicProfilePageState extends State<PublicProfilePage> {
  late final ProfileAndRentalController profileController;

  @override
  void initState() {
    super.initState();
    profileController = Get.put(ProfileAndRentalController());
  }

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
            ],
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
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
                      onTap: () => Get.to(() => const FollowersPage()),
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
                      onTap: () => Get.to(() => const FollowingPage()),
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
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => ElevatedButton(
                        onPressed: () => profileController.toggleFollow(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: profileController.isFollowing.value
                              ? Colors.grey[800]
                              : const Color.fromARGB(255, 37, 200, 255),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          minimumSize: const Size(0, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          profileController.isFollowing.value ? 'Mengikuti' : 'Ikuti',
                          style: const TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => MessagePage(
                          recipientName: profileController.username.value,
                          profileColor: const Color(0xFFFF8225),
                        )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8225),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(0, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Chat seller',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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

  Widget _buildTabBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: const TabBar(
        labelColor: Color(0xFFFF8225),
        unselectedLabelColor: Colors.grey,
        indicatorColor: Color(0xFFFF8225),
        labelStyle: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        tabs: [
          Tab(text: 'Barang Disewakan'),
          Tab(text: 'Review'),  // Added second tab since length is 2
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildBarangDisewakanGrid(),
          const Center(child: Text('Review Tab', style: TextStyle(color: Colors.white))), // Added second view
        ],
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
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProfileAndRentalController>();
    super.dispose();
  }
}