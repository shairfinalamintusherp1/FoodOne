import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/forget_password.dart';
import 'package:foodone/prasentation/auth/signup.dart';
import 'package:foodone/prasentation/auth/location_permission.dart';
import 'package:foodone/prasentation/rider%20app/rider_root_page.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderLoginPage extends StatefulWidget {
  RiderLoginPage({super.key});

  @override
  State<RiderLoginPage> createState() => _RiderLoginPageState();
}

class _RiderLoginPageState extends State<RiderLoginPage> {
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
                      onTap: () {
                        commonNavigation(
                          context,
                          pageName: ForgetPasswordPage(),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                commonButton(
                  text: "Sign in",
                  onPressedButton: () {
                    commonNavigation(
                      context,
                      pageName: LocationPermissionPage(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                commonButton(
                  text: "One click Login",
                  onPressedButton: () {
                    commonNavigation(context, pageName: RiderRootPage());
                  },
                  color: secondaryColor,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        commonNavigation(context, pageName: SignUpPage());
                      },
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
