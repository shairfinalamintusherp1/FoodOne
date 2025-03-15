import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/forget_password.dart';
import 'package:foodone/prasentation/auth/location.dart';
import 'package:foodone/prasentation/auth/reset_password.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangalicious Story',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: LocationPage(),
    );
  }
}
