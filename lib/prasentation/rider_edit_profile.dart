import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderEditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(height: 140, color: primaryColor),
        ),

        title: commonText(
          "Edit Profile",
          size: 21.0,
          fontWeigth: FontWeight.w500,
          color: whiteColor,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0),
              Center(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://as2.ftcdn.net/v2/jpg/02/14/74/61/1000_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(width: 3, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              commonTextField(text: "Full Name", color: Colors.black12),
              SizedBox(height: 20.0),

              commonTextField(text: "Email", color: Colors.black12),
              SizedBox(height: 20.0),

              commonTextField(
                text: "Phone Number (Optional)",
                color: Colors.black12,
              ),
              SizedBox(height: 20.0),

              commonTextField(text: "Password", color: Colors.black12),
              SizedBox(height: 20.0),

              commonTextField(text: "Confirm Password", color: Colors.black12),
              SizedBox(height: 30.0),

              // Update Button
              commonButton(
                text: "Update",
                onPressedButton: () {
                  // Handle Update
                  print("Profile Updated");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: RiderEditProfilePage()));
}
