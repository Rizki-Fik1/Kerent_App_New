import 'package:flutter/material.dart';

class ConfirmNumber extends StatefulWidget {
  const ConfirmNumber({super.key});

  @override
  State<ConfirmNumber> createState() => _SignInPageState();
}

class _SignInPageState extends State<ConfirmNumber> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final List<String> _code = ["", "", "", "", "", ""]; // Code input
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void dispose() {
    _phoneNumberController.dispose();
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
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
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter Code',
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
                  'We sent a verification code to your email',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Opacity(
                opacity: 0.50,
                child: Text(
                  '',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              // Code Input
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 40,
                    margin: const EdgeInsets.only(right: 0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Center(
                      child: TextFormField(
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          setState(() {
                            _code[index] = text;
                          });
                          if (text.length == 1 && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: '-',
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 30),
              // Next Button
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
                      // Process the phone number and the code
                      // e.g., send an SMS with a verification code
                      // or make an API call to authenticate
                      // ...
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