import 'package:flutter/material.dart';
import 'package:foodone/models/country_model.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderLocationPage extends StatefulWidget {
  const RiderLocationPage({super.key});

  @override
  State<RiderLocationPage> createState() => _RiderLocationPageState();
}

class _RiderLocationPageState extends State<RiderLocationPage> {
  List<CountryModel> countryList = [
    CountryModel(name: "Indonesia", code: "+62", flag: "🇮🇩"),
    CountryModel(name: "Riyadh", code: "+966", flag: "🇸🇦"),
  ];

  String selectedCountryCode = "+62";

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
          "Location",
          size: 21,
          fontWeigth: FontWeight.w500,
          color: whiteColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "Current Location",
              size: 14,
              fontWeigth: FontWeight.w500,
            ),
            SizedBox(height: 10.0),
            commonText("Country"),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCountryCode,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCountryCode = newValue!;
                    });
                    print("Selected Country Code: $selectedCountryCode");
                  },
                  items:
                      countryList.map((CountryModel country) {
                        return DropdownMenuItem<String>(
                          value: country.code,
                          child: Row(
                            children: [
                              commonText(
                                "  ${country.flag}  ",
                                size: 18,
                              ), // Flag
                              SizedBox(width: 5),
                              commonText(country.name, size: 12), // Code
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            commonText("City"),
            SizedBox(height: 10.0),
            commonTextField(text: "Saudi Arabia", color: primaryColor),
            SizedBox(height: 20),
            commonText("Street"),
            SizedBox(height: 10.0),
            commonTextField(text: "Saudi Arabia", color: primaryColor),
            SizedBox(height: 20),
            commonText(
              "Add New Location",
              fontWeigth: FontWeight.w500,
              size: 14,
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle_outline),
                  SizedBox(width: 8.0),
                  commonText("Add New Location", color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
