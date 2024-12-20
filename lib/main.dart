import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:kerent_app/profile_page/controller/profile_controller.dart';
import 'package:kerent_app/profile_page/Followers_page.dart';
import 'package:kerent_app/profile_page/Following_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Homecontroller homeController = Get.put(Homecontroller());
  final ProfileAndRentalController profileController = Get.put(ProfileAndRentalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/followers', page: () =>  const FollowersPage()),
        GetPage(name: '/following', page: () =>  const FollowingPage()),
      ],
      home: const HomePage(),
    );
  }
}