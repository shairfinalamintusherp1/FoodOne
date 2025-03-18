import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderWithdraw extends StatelessWidget {
  const RiderWithdraw({super.key});

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
          "Withdraw History",
          size: 20,
          fontWeigth: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: commonButton(
                text: "Withdraw",
                color: Colors.white,
                borderColor: primaryColor,
                textColor: primaryColor,
                fontWeigth: FontWeight.w500,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: commonButton(
                text: "Withdraw Request",
                textColor: Colors.white,
                fontWeigth: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
