import 'package:flutter/material.dart';
import 'package:foodone/models/country_model.dart';
import 'package:foodone/prasentation/auth/login.dart';
import 'package:foodone/prasentation/location_permission.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  List<CountryModel> countryList = [
    CountryModel(name: "Indonesia", code: "+62", flag: "🇮🇩"),
    CountryModel(name: "Saudi Arabia", code: "+966", flag: "🇸🇦"),
  ];

  String selectedCountryCode = "+62";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image.asset("assest/images/logo.png")),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome! ",
                        style: TextStyle(
                          color: primaryDarkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Please fill the form to continue.",
                        style: TextStyle(color: textPrimaryColor, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                commonTextField(text: "Full Name", controller: nameController),
                const SizedBox(height: 20),
                commonTextField(text: "E-mail", controller: emailController),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Container(
                      width: 100, // Adjust width as needed
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedCountryCode,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCountryCode = newValue!;
                              });
                            },
                            items:
                                countryList.map((CountryModel country) {
                                  return DropdownMenuItem<String>(
                                    value: country.code,
                                    child: Row(
                                      children: [
                                        commonText(
                                          country.flag,
                                          size: 18,
                                        ), // Flag
                                        SizedBox(width: 5),
                                        commonText(
                                          country.code,
                                          size: 12,
                                        ), // Code
                                      ],
                                    ),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: commonTextField(
                        text: "Phone Number",
                        controller: phoneController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                commonTextField(
                  text: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                commonTextField(
                  text: "Confirm Password",
                  controller: confirmPassController,
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

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Already have an account?"),
                    InkWell(
                      onTap:
                          () =>
                              commonNavigation(context, pageName: LoginPage()),
                      child: commonText("  Sign in", color: primaryDarkColor),
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
