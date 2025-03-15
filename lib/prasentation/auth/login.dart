import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assest/images/logo.png"),
                const SizedBox(height: 30),
                commonTextField(
                  text: "Email",
                  prefixIxon: Icon(Icons.email_outlined, color: primaryColor),

                  controller: emailController,
                ),
                const SizedBox(height: 20),
                commonTextField(
                  text: "Password",
                  prefixIxon: Icon(
                    Icons.lock_outline_rounded,
                    color: primaryColor,
                  ),
                  controller: passwordController,
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: commonText(
                        "Forget your password?",
                        color: primaryDarkColor,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                commonButton(text: "Sign in", onPressedButton: () {}),
                const SizedBox(height: 16),
                commonButton(
                  text: "One click Login",
                  onPressedButton: () {},
                  color: secondaryColor,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Don't have an account?"),
                    InkWell(
                      child: commonText("  Sign Up", color: primaryDarkColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
