import 'package:flutter/material.dart';

class AccountCompletionScreen extends StatelessWidget {
  const AccountCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Complete Your Account',
                style: TextStyle(
                color: Color(0xFFF8F8F8),
                fontSize: 20,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    
                    //Foto Profil
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlue,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Text(
                      'Your Profile',
                      style: TextStyle(
                        color: Color(0xFFD4C4FC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        ),
                    ),
                    const Text(
                      'Introduce yourself to fellow renters.',
                      style: TextStyle(
                      color: Color(0xFFD4C4FC),
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                        ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              _buildTextField('Name'),
              const SizedBox(height: 15),
              _buildDateField(),
              const SizedBox(height: 15),
              _buildTextField('Class'),
              const SizedBox(height: 15),
              _buildPhoneField(),
              const Spacer(),

              //Button Next
                SizedBox(
                  child: Align(
                  alignment: const Alignment(1, 1),
                    child: Container(
                    margin: const EdgeInsets.only(right: 15,),
                      child: GestureDetector(
                        onTap: () { 
                      },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xFFD4C4FC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            )

            ],
          ),
          ]
        )
        ),
      ),
    );
  }

  //Name and Class
  Widget _buildTextField(String label) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFD4C4FC),
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 248,
            decoration: BoxDecoration(color: Colors.grey[900],),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
              border: InputBorder.none,
            ),
          )
        )
      ]
    )
  );
}



  Widget _buildDateField() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(
              color: Color(0xFFD4C4FC),
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            ),
            Container(
              width: 248,
              decoration: BoxDecoration(color: Colors.grey[900],),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '00/00/0000',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.calendar_month_outlined, color: Colors.grey, size: 19,),
                  ),
                readOnly: false,
                onTap: () {
                 // Here you would typically show a date picker
                  },
                ),
              )
        ],
      ),
    );
  }



  Widget _buildPhoneField() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phone Number',
            style: TextStyle(
              color: Color(0xFFD4C4FC),
              fontSize: 11,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            ),
            Container(
              width: 248,
              decoration: BoxDecoration(color: Colors.grey[900],),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '+62 xxx xxxx xxxx',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none
                ),
                  keyboardType: TextInputType.phone,
              ),
            )
        ],
      ),
    );
  }
}