import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Lakukan inisialisasi atau pengambilan data yang diperlukan
    await _initializeApp();

    // Setelah inisialisasi selesai, navigasikan ke halaman utama
    Get.offAllNamed('/home');
  }

  Future<void> _initializeApp() async {
    // Simulasi proses inisialisasi aplikasi
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isInitialized)
              Image.asset(
                'lib/assets/ls-logo.png',
                width: 150,
                height: 150,
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}