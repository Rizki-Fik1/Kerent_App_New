import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AccountCompletionScreen extends StatelessWidget {
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

              Text(
                'Complete Your Account',
                style: TextStyle(
                color: Color(0xFFF8F8F8),
                fontSize: 20,
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    
                    //Foto Profil
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlue,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      'Your Profile',
                      style: TextStyle(
                        color: Color(0xFFD4C4FC),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        ),
                    ),
                    Text(
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

              SizedBox(height: 30),
              _buildTextField('Name'),
              SizedBox(height: 15),
              _buildDateField(),
              SizedBox(height: 15),
              _buildTextField('Class'),
              SizedBox(height: 15),
              _buildPhoneField(),
              Spacer(),

              //Button Next
                SizedBox(
                  child: Align(
                  alignment: Alignment(1, 1),
                    child: Container(
                    margin: EdgeInsets.only(right: 15,),
                      child: GestureDetector(
                        onTap: () { 
                      },
                    child: Text(
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
          Text(
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
                style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
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
          Text(
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
              child: TextField(
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