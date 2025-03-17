import 'package:flutter/material.dart';
import 'package:foodone/models/country_model.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderLanguagePage extends StatefulWidget {
  @override
  _RiderLanguagePageState createState() => _RiderLanguagePageState();
}

class _RiderLanguagePageState extends State<RiderLanguagePage> {
  String selectedCountry = "Indonesia"; // Default selected country

  final List<CountryModel> countryList = [
    CountryModel(name: "Indonesia", code: "+62", flag: "🇮🇩"),
    CountryModel(name: "Saudi Arabia", code: "+966", flag: "🇸🇦"),
  ];

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
          "Language",
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
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  final country = countryList[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,

                        color:
                            selectedCountry == country.name
                                ? primaryColor
                                : Colors.transparent,
                      ),
                    ),
                    child: Card(
                      margin: EdgeInsets.all(0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: commonText(
                          country.flag,
                          size: 24,
                        ), // Display country flag
                        title: commonText(
                          country.name,
                          size: 16,
                          fontWeigth: FontWeight.w500,
                        ),
                        trailing:
                            selectedCountry == country.name
                                ? Icon(Icons.check_circle, color: primaryColor)
                                : null,
                        onTap: () {
                          setState(() {
                            selectedCountry =
                                country.name; // Update selected country
                          });
                          print("Selected Country: ${country.name}");
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
