import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/chat_page/message.dart';
import 'package:kerent_app/home_page/NavigatorBottom.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/profile_page/profile_public.dart';

// Model untuk hasil pencarian
class SearchResult {
  final String name;
  final Color color;
  final String? lastMessage;
  final String? time;
  final bool isProfile;

  SearchResult({
    required this.name,
    required this.color,
    this.lastMessage,
    this.time,
    required this.isProfile,
  });
}

// Controller untuk mengelola state dan logika
class ChatListController extends GetxController {
  final RxList<SearchResult> allItems = <SearchResult>[].obs;
  final RxList<SearchResult> filteredItems = <SearchResult>[].obs;
  final RxBool isSearching = false.obs;
  final RxString searchQuery = ''.obs;
  
  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    // Simulasi data - dalam implementasi nyata, ini akan diambil dari backend
    allItems.value = [
      // Chats
      SearchResult(
        name: 'Rifqi Aditya',
        color: Colors.blue,
        lastMessage: 'Last message 1',
        time: '10:30 AM',
        isProfile: false
      ),
      SearchResult(
        name: 'Qiqi',
        color: Colors.indigo,
        lastMessage: 'Last message 2',
        time: '11:45 AM',
        isProfile: false
      ),
            SearchResult(
        name: 'Rifqi Aditya',
        color: Colors.blue,
        lastMessage: 'Last message 1',
        time: '10:30 AM',
        isProfile: false
      ),
      SearchResult(
        name: 'Qiqi',
        color: Colors.indigo,
        lastMessage: 'Last message 2',
        time: '11:45 AM',
        isProfile: false
      ),
            SearchResult(
        name: 'Rifqi Aditya',
        color: Colors.blue,
        lastMessage: 'Last message 1',
        time: '10:30 AM',
        isProfile: false
      ),
      SearchResult(
        name: 'Qiqi',
        color: Colors.indigo,
        lastMessage: 'Last message 2',
        time: '11:45 AM',
        isProfile: false
      ),
      
      // Profiles
      SearchResult(
        name: 'Hilmi Adli',
        color: Colors.green,
        isProfile: true
      ),
      SearchResult(
        name: 'Faezya',
        color: Colors.purple,
        isProfile: true
      ),
            SearchResult(
        name: 'Hilmi Adli',
        color: Colors.green,
        isProfile: true
      ),
      SearchResult(
        name: 'Rena',
        color: Colors.purple,
        isProfile: true
      ),
            SearchResult(
        name: 'Hilmi Adli',
        color: Colors.green,
        isProfile: true
      ),
      SearchResult(
        name: 'Faezya',
        color: Colors.purple,
        isProfile: true
      ),
    ];
    filteredItems.value = allItems.where((item) => !item.isProfile).toList();
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredItems.value = allItems.where((item) => !item.isProfile).toList();
    } else {
      filteredItems.value = allItems.where((item) {
        final matchesName = item.name.toLowerCase().contains(query.toLowerCase());
        final matchesMessage = item.lastMessage?.toLowerCase().contains(query.toLowerCase()) ?? false;
        return matchesName || matchesMessage;
      }).toList();
    }
  }

  // Menambahkan method untuk mencari pengguna
  void searchUsers(String query) {
    if (query.isEmpty) {
      filteredItems.value = [];
    } else {
      filteredItems.value = allItems.where((item) {
        if (!item.isProfile) return false;
        return item.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  final ChatListController chatController = Get.put(ChatListController());
  final ProfileAndRentalController profileController = Get.put(ProfileAndRentalController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Obx(() => chatController.isSearching.value
                ? _buildSearchBar()
                : const SizedBox.shrink()),
            const SizedBox(height: 16),
            _buildOnlineUsers(context),
            const SizedBox(height: 20),
            _buildChatsHeader(),
            _buildSearchResults(context),
          ],
        ),
      ),
      currentIndex: 1,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selamat Siang',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                '${profileController.username}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                )
              )),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person_add, color: Colors.blue),
                    onPressed: () => _showSearchUserDialog(context),
                  ),
                  IconButton(
                    icon: Obx(() => Icon(
                      chatController.isSearching.value ? Icons.close : Icons.search,
                      color: Colors.blue
                    )),
                    onPressed: () => _handleSearchToggle(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSearchUserDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF31363F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Cari Pengguna',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama pengguna...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFF222831),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    chatController.searchUsers(value);
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: Obx(() {
                    final profiles = chatController.filteredItems
                        .where((item) => item.isProfile)
                        .toList();
                    
                    if (profiles.isEmpty) {
                      return const Center(
                        child: Text(
                          'Tidak ada pengguna ditemukan',
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: profiles.length,
                      itemBuilder: (context, index) {
                        final profile = profiles[index];
                        return _buildProfileTile(context, profile);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Cari chat...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF31363F),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          chatController.searchQuery.value = value;
          if (value.isEmpty) {
            chatController.filteredItems.value = 
                chatController.allItems.where((item) => !item.isProfile).toList();
          } else {
            chatController.filteredItems.value = chatController.allItems.where((item) {
              if (item.isProfile) return false;
              final matchesName = item.name.toLowerCase().contains(value.toLowerCase());
              final matchesMessage = 
                  item.lastMessage?.toLowerCase().contains(value.toLowerCase()) ?? false;
              return matchesName || matchesMessage;
            }).toList();
          }
        },
      ),
    );
  }

  Widget _buildOnlineUsers(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildProfileOption(context, Colors.blue, 'Rifqi Aditya'),
          const SizedBox(width: 16),
          _buildProfileOption(context, Colors.indigo, 'Qiqi'),
          const SizedBox(width: 16),
          _buildProfileOption(context, Colors.red, 'Putra'),
          const SizedBox(width: 16),
          _buildProfileOption(context, Colors.yellow, 'Rena'),
          const SizedBox(width: 16),
          _buildProfileOption(context, Colors.green, 'Mikal'),
        ],
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, Color color, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(
              recipientName: name,
              profileColor: color,
            ),
          ),
        );
      },
      child: Container(
        width: 90,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF31363F),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Text(
                name[0],
                style: const TextStyle(color: Colors.white, fontSize: 18)
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatsHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Chats',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final items = chatController.filteredItems
            .where((item) => !item.isProfile)
            .toList();
        
        if (items.isEmpty) {
          return const Center(
            child: Text(
              'Tidak ada hasil ditemukan',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildChatTile(
              context,
              item.color,
              item.name,
              item.lastMessage ?? '',
              item.time ?? '',
            );
          },
        );
      }),
    );
  }

  Widget _buildProfileTile(BuildContext context, SearchResult profile) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: profile.color,
        child: Text(
          profile.name[0],
          style: const TextStyle(color: Colors.white)
        ),
      ),
      title: Text(
        profile.name,
        style: const TextStyle(color: Colors.white)
      ),
      subtitle: const Text(
        'Ketuk untuk melihat profil',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey,
        size: 16,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PublicProfilePage(),
          ),
        );
      },
    );
  }

  Widget _buildChatTile(BuildContext context, Color color, String name,
      String lastMessage, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          name[0],
          style: const TextStyle(color: Colors.white)
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white)
      ),
      subtitle: Text(
        lastMessage,
        style: const TextStyle(color: Colors.grey),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey, fontSize: 12)
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(
              recipientName: name,
              profileColor: color,
            ),
          ),
        );
      },
    );
  }

  void _handleSearchToggle(BuildContext context) {
    chatController.isSearching.value = !chatController.isSearching.value;
    if (!chatController.isSearching.value) {
      chatController.search(''); // Reset search
    }
  }
}