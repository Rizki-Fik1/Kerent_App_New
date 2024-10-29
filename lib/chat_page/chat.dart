import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kerent_app/chat_page/message.dart';
import 'package:kerent_app/home_page/NavigatorBottom.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                      const Text(
                        'Qiqi R.R',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.blue),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.blue),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 110, // Ubah tinggi di sini untuk memastikan ukuran yang konsisten
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildProfileOption(context, Colors.blue, 'Rifqi Aditya'),
                  const SizedBox(width: 16),
                  _buildProfileOption(context, Colors.indigo, 'Qiqi'),
                  const SizedBox(width: 16),
                  _buildProfileOption(context, Colors.red, 'Qiqi'),
                  const SizedBox(width: 16),
                  _buildProfileOption(context, Colors.yellow, 'Qiqi'),
                  const SizedBox(width: 16),
                  _buildProfileOption(context, Colors.green, 'Qiqi'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Chats',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildChatTile(context, Colors.blue, 'Riqi Aditya', 'Last message 1', '10:30 AM'),
                  _buildChatTile(context, Colors.indigo, 'Riqi Aditya', 'Last message 2', '11:45 AM'),
                  _buildChatTile(context, Colors.red, 'Riqi Aditya', 'Last message 3', '2:15 PM'),
                  _buildChatTile(context, Colors.yellow, 'Riqi Aditya', 'Last message 4', '4:20 PM'),
                ],
              ),
            ),
          ],
        ),
      ),
      currentIndex: 1,
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
            child: Text(name[0], style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}


  Widget _buildChatTile(BuildContext context, Color color, String name, String lastMessage, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name, style: const TextStyle(color: Colors.white)),
      subtitle: Text(lastMessage, style: const TextStyle(color: Colors.grey)),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(recipientName: name, profileColor: color,),
          ),
        );
      },
    );
  }
}