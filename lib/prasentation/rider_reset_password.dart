import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderResetPasswordPage extends StatelessWidget {
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
          "Reset Password",
          size: 21,
          fontWeigth: FontWeight.w500,
          color: whiteColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            commonTextField(text: "Current Password", color: Colors.black12),
            SizedBox(height: 20),

            commonTextField(text: "New Password", color: Colors.black12),
            SizedBox(height: 20),

            commonTextField(text: "Confirm Password", color: Colors.black12),
            SizedBox(height: 30),

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
    );
  }
}
