// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodone/prasentation/rider_root_page.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  _AddLocationPageState createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  LatLng? _currentPosition;
  final TextEditingController countryController = TextEditingController(
    text: "Indonesia",
  );
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      _getCurrentLocation();
    } else {}
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter:
                  _currentPosition ??
                  const LatLng(37.7749, -122.4194), // Default: San Francisco
              maxZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: const ['a', 'b', 'c'],
              ),
              if (_currentPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentPosition!,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.pink,
                        size: 40,
                      ),
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 40,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const FittedBox(
                  child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: commonText(
                "Add Location",
                size: 21,
                fontWeigth: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonTextField(
                    text: "Indonesia",
                    fillColor: Colors.white,
                    controller: countryController,
                    suffixIcon: const Icon(
                      Icons.location_on,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 10),
                  commonTextField(
                    text: "City Name",
                    fillColor: Colors.white,
                    controller: cityController,
                  ),
                  const SizedBox(height: 10),
                  commonTextField(
                    text: "Street No.",
                    fillColor: Colors.white,
                    controller: streetController,
                  ),
                  const SizedBox(height: 20),
                  commonButton(
                    text: "Save",
                    color: Colors.pink,
                    onPressedButton: () {
                      // Save location action
                      commonNavigation(context, pageName: RootPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
