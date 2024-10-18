import 'package:flutter/material.dart';
import 'package:kerent_app/home_page/cobahome.dart';
import 'package:kerent_app/home_page/controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:kerent_app/login_signin_page/complete.dart';
import 'package:kerent_app/login_signin_page/create_acc.dart';
import 'package:kerent_app/checkout_page/checkout_new.dart';
import 'package:kerent_app/checkout_page/payment.dart';
import 'package:kerent_app/chat_page/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Homecontroller homeController = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage (),
    );
  }
}
