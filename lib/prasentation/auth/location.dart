import 'package:flutter/material.dart';
import 'package:foodone/models/country_model.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<CountryModel> countryList = [
    CountryModel(name: "Indonesia", code: "+62", flag: "🇮🇩"),
    CountryModel(name: "Riyadh", code: "+966", flag: "🇸🇦"),
  ];

  String selectedCountryCode = "+62";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
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
          children: [
            commonText(
              "Current Location",
              size: 16,
              fontWeigth: FontWeight.w500,
            ),
            SizedBox(height: 10.0),
            commonText("Country"),
            SizedBox(height: 8.0),
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
                      print("Selected Country Code: $selectedCountryCode");
                    },
                    items:
                        countryList.map((CountryModel country) {
                          return DropdownMenuItem<String>(
                            value: country.code,
                            child: Row(
                              children: [
                                commonText(country.flag, size: 18), // Flag
                                SizedBox(width: 5),
                                commonText(country.code, size: 12), // Code
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
