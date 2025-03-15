import 'package:flutter/material.dart';

class RiderProfilePage extends StatefulWidget {
  const RiderProfilePage({super.key});

  @override
  State<RiderProfilePage> createState() => _RiderProfilePageState();
}

class _RiderProfilePageState extends State<RiderProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                FittedBox(fit: BoxFit.fitWidth, child: Image.asset("name")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
