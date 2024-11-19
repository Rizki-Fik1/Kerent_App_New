import 'package:flutter/material.dart';
import 'package:get/get.dart';

// change_password_page.dart
class ChangePasswordPage extends StatelessWidget {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              label: 'Current Password',
              controller: _currentPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              label: 'New Password',
              controller: _newPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(
              label: 'Confirm New Password',
              controller: _confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validation logic could be added here
                  if (_newPasswordController.text == _confirmPasswordController.text) {
                    // Implement password change logic
                    Get.back();
                    Get.snackbar(
                      'Success',
                      'Password updated successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'New passwords do not match',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8225),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8225)),
        ),
      ),
    );
  }
}