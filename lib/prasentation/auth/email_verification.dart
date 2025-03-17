import 'package:flutter/material.dart';
import 'package:foodone/prasentation/auth/reset_password.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class EmailVarificationPage extends StatefulWidget {
  @override
  _EmailVarificationPageState createState() => _EmailVarificationPageState();
}

class _EmailVarificationPageState extends State<EmailVarificationPage> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  bool _isResendDisabled = true;
  int _countdownTime = 60; // 1-minute countdown

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Start the 1-minute countdown
  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_countdownTime > 0) {
        setState(() {
          _countdownTime--;
        });
        _startCountdown(); // Recursive call to continue the countdown
      } else {
        setState(() {
          _isResendDisabled = false; // Enable the Resend button
        });
      }
    });
  }

  // Handle verification code input
  void _handleVerificationCodeInput(int index, String value) {
    if (value.isNotEmpty) {
      if (index < 3) {
        // Move focus to the next field
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        // If it's the last field, unfocus
        _focusNodes[index].unfocus();
      }
    } else if (index > 0) {
      // Move focus to the previous field if the current field is empty
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              'Email Verification',
              size: 20,
              fontWeigth: FontWeight.bold,
            ),
            SizedBox(height: 10),
            commonText('Enter the verification code we send you on:'),
            SizedBox(height: 10),
            commonText('habib*****2415@gmail.com'),
            SizedBox(height: 20),

            // Verification Code Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return _buildVerificationCodeField(index);
              }),
            ),
            SizedBox(height: 20),

            // Resend Code Text with Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonText(
                  "Didn’t Receive Code? ",
                  size: 14,
                  color: textSecondaryColor,
                ),
                GestureDetector(
                  onTap:
                      _isResendDisabled
                          ? null
                          : () {
                            // Handle Resend Code
                            print('Resend Code');
                            setState(() {
                              _isResendDisabled = true;
                              _countdownTime = 60;
                            });
                            _startCountdown();
                          },
                  child: commonText(
                    "Resend",
                    color: primaryColor,
                    fontWeigth: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (_isResendDisabled)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.watch_later_outlined, color: primaryColor),
                  commonText(
                    "  $_countdownTime s",
                    color: primaryColor,
                    fontWeigth: FontWeight.bold,
                  ),
                ],
              ),
            SizedBox(height: 20),

            Spacer(),
            commonButton(
              text: "Continue",
              onPressedButton: () {
                commonNavigation(context, pageName: ResetPasswordPage());
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper method to build verification code input fields
  Widget _buildVerificationCodeField(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(counterText: '', border: InputBorder.none),
        onChanged: (value) {
          _handleVerificationCodeInput(index, value);
        },
      ),
    );
  }
}
