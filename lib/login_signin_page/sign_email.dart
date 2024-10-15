import 'package:flutter/material.dart';
import 'package:kerent_app/login_signin_page/confirm_phone.dart';

class SignInMail extends StatefulWidget {
  const SignInMail ({super.key});

  @override
  State<SignInMail> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInMail> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 16),
              Container(
              child: Stack(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const ShapeDecoration(
                    color: Color(0xFFEEEEEE),
                    shape: OvalBorder(),
                    ),
                  ),
            Positioned(
                right: 11,
                top: 6,
                child: Container(
                    width: 18.2,
                    height: 28.8,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: Color(0xFF686D76)),
                            borderRadius: BorderRadius.circular(5),
                        ),
                    ),
                ),
            ),
                ],
              )
            ),


              const SizedBox(height: 16),
              const Text(
                'Continue with Email',
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const Opacity(
                opacity: 0.50,
              child: Text(
                'Sign in or sign up with your email.',
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500
                ),
              ),
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(9))
                  ),
                  
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+").hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(320, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                    backgroundColor: const Color(0xFF191919),
                  ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConfirmNumber()),
                  );
                  }
                },
                child: const Text(
                  'Next',
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                 ), 
                  ),
              ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}