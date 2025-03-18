import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/rider_login.dart';

class CustomerSplashPage extends StatelessWidget {
  const CustomerSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RiderLoginPage();
          },
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assest/images/splash_logo.png"),
            Image.asset("assest/images/splash_logo.png"),
          ],
        ),
      ),
    );
  }
}
