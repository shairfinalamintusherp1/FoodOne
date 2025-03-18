import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/login.dart';

class RiderSplashPage extends StatelessWidget {
  const RiderSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    });
    return Scaffold(
      body: Center(child: Image.asset("assest/images/splash_logo.png")),
    );
  }
}
