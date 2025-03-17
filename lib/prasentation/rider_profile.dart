import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider_edit_profile.dart';
import 'package:foodone/prasentation/rider_language.dart';
import 'package:foodone/prasentation/rider_location.dart';
import 'package:foodone/prasentation/rider_reset_password.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderProfilePage extends StatefulWidget {
  const RiderProfilePage({super.key});

  @override
  State<RiderProfilePage> createState() => _RiderProfilePageState();
}

class _RiderProfilePageState extends State<RiderProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: commonText(
          "Profile",
          size: 21,
          fontWeigth: FontWeight.bold,
          color: Colors.white,
        ),
        actions: [
          InkWell(
            onTap: () {
              commonNavigation(context, pageName: RiderEditProfilePage());
            },
            child: Icon(Icons.edit_document, color: Colors.white),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,

            children: [
              ClipPath(
                clipper: CustomReatangleClipper(),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  color: primaryColor,
                ),
              ),
              // Image.asset("assest/images/Ellipse 1.png", fit: BoxFit.fill),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://as2.ftcdn.net/v2/jpg/02/14/74/61/1000_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
                    ), // Add your image asset
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: infoCard(
                    "Total Delivery\nAmount",
                    "\$0.00",
                    primaryColor,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 6,
                  child: infoCard(
                    "Total Orders\nCompleted",
                    "0",
                    secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          profileOption(Icons.person, "Md Habib Khan"),
          profileOption(Icons.badge, "015415"),
          profileOption(Icons.phone, "055********"),
          profileOption(
            Icons.lock,
            "Change Password",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: primaryColor,
            ),
            ontap: () {
              commonNavigation(context, pageName: RiderResetPasswordPage());
            },
          ),
          profileOption(
            Icons.language,
            "Change Language",
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: primaryColor,
            ),
            ontap: () {
              commonNavigation(context, pageName: RiderLanguagePage());
            },
          ),
          profileOption(
            Icons.location_on,
            "Current Location",
            trailing: const Icon(Icons.edit, size: 18, color: primaryColor),
            ontap: () {
              commonNavigation(context, pageName: RiderLocationPage());
            },
          ),
        ],
      ),
    );
  }

  Widget infoCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          commonText(
            title,
            color: Colors.white,
            alinment: TextAlign.center,
            fontWeigth: FontWeight.w500,
          ),
          const SizedBox(height: 5),
          commonText(
            value,
            alinment: TextAlign.center,
            color: Colors.white,
            size: 16,
            fontWeigth: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget profileOption(IconData icon, String text, {Widget? trailing, ontap}) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: commonText(text, fontWeigth: FontWeight.w500),
      trailing: trailing,
      onTap: ontap,
    );
  }
}

class CustomReatangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path =
        Path()
          ..lineTo(0, size.height - 80)
          ..quadraticBezierTo(
            size.width / 2,
            size.height + 80,
            size.width,
            size.height - 80,
          )
          ..lineTo(size.width, 0)
          ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
