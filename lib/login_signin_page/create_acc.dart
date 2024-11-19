import 'package:flutter/material.dart';

class LoginRegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  LoginRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      body: Form(
        key: _formKey,
        child: SafeArea(
        child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Kerent',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Silakan masukkan detail untuk masuk.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Image.asset('lib/assets/google-icon2.png',height: 20,),
                        label: const Text(''),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, 
                          backgroundColor: const Color(0xFF2A2A2A),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.phone_android_sharp),
                        label: const Text(''),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, 
                          backgroundColor: const Color(0xFF2A2A2A),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                _buildInputField('Username'),
                const SizedBox(height: 15),
                _buildInputField('Phone Number', isPhoneNumber: true),
                const SizedBox(height: 15),
                _buildInputField('Email', isEmail: true),
                const SizedBox(height: 15),
                _buildInputField('Password', isPassword: true),
                const SizedBox(height: 15),
                _buildInputField('Confirm Password', isPassword: true, isConfirmPassword: true),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
        )
      ),
    )
    );
  }

  Widget _buildInputField(String label, {bool isPassword = false, bool isConfirmPassword = false, bool isEmail = false, bool isPhoneNumber = false}) {
    return TextFormField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: isPhoneNumber ? TextInputType.phone : TextInputType.text,
          validator: (value) {

      //Password
      if (isPassword) {
        if (value!.length < 8) {
          return 'Password must be at least 8 characters';
        }
        if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must contain at least one lowercase letter';
        }
        if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must contain at least one uppercase letter';
        }
        if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must contain at least one number';
        }
      }
      if (isConfirmPassword) {
        if (value != _password) {
           return 'Passwords do not match';
        }
      }

      //Email
      if (isEmail) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
         if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+").hasMatch(value)) {
        return 'Please enter a valid email';
      }
          }
      return null;
    },
    );
  }
}