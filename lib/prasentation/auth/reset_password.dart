import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider_root_page.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            commonText("Reset Password", fontWeigth: FontWeight.w500, size: 21),
            SizedBox(height: 10.0),
            commonText(
              "Enter the verification code we send you on: habib******2415@gmail.com",
            ),
            SizedBox(height: 30),
            commonTextField(
              text: "New Password",
              prefixIxon: Icon(Icons.email_outlined, color: primaryColor),
              controller: passwordController,
            ),
            SizedBox(height: 20),
            commonTextField(
              text: "Confirm Password",
              prefixIxon: Icon(Icons.email_outlined, color: primaryColor),
              controller: confirmPasswordController,
            ),
            Spacer(),
            commonButton(
              text: "Continue",
              onPressedButton: () {
                commonNavigation(context, pageName: RootPage());
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
