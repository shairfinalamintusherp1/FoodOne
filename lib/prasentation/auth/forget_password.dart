import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/email_verification.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "Forgot password?",
              fontWeigth: FontWeight.w500,
              size: 21,
            ),
            SizedBox(height: 10.0),
            commonText(
              "Enter your email address and we’ll send you confirmation code to reset your password",
            ),
            SizedBox(height: 30),
            commonTextField(
              text: "Email or Phone number",
              prefixIxon: Icon(Icons.email_outlined, color: primaryColor),
              controller: emailController,
            ),
            Spacer(),
            commonButton(
              text: "Continue",
              onPressedButton:
                  () => commonNavigation(
                    context,
                    pageName: EmailVarificationPage(),
                  ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
