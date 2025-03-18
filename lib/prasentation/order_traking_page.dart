import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';
import 'package:latlong2/latlong.dart';

class OrderTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMap(), // Map background
          _buildBottomSheet(context), // Delivery details
        ],
      ),
    );
  }

  /// FlutterMap for showing delivery route
  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(37.7749, -122.4194), // Example: San Francisco
        maxZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(37.7749, -122.4194),
              child: Icon(Icons.location_pin, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }

  /// Bottom sheet for delivery details
  Widget _buildBottomSheet(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                SizedBox(height: 20),
                _buildStepProgress(),
                SizedBox(height: 15),
                _buildOrderDetails(),
              ],
            ),
          ),
          _buildDeliveryPersonInfo(),
        ],
      ),
    );
  }

  /// Delivery person information
  Widget _buildDeliveryPersonInfo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            "https://as2.ftcdn.net/v2/jpg/02/14/74/61/1000_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg",
          ),
        ),

        title: commonText(
          "Cristopert Dastin",
          size: 16,
          fontWeigth: FontWeight.bold,
          color: Colors.white,
        ),
        subtitle: commonText("ID 213752", size: 14, color: Colors.white),

        trailing: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.call_outlined, color: primaryColor),
        ),
      ),
    );
  }

  /// Step progress tracker
  Widget _buildStepProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Your Delivery Time", size: 16, fontWeigth: FontWeight.bold),
        commonText("Estimated 8:30 - 9:15 PM", size: 14, color: Colors.grey),
        SizedBox(height: 10),
        CustomHorizontalStepper(currentStep: 2),
      ],
    );
  }

  /// Order details
  Widget _buildOrderDetails() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Order", size: 16, fontWeigth: FontWeight.bold),
              commonText("1 Burger", size: 14),
            ],
          ),
        ),
        commonText("Total: \$32.00", size: 16, fontWeigth: FontWeight.bold),
      ],
    );
  }
}

/// Custom horizontal stepper widget
class CustomHorizontalStepper extends StatelessWidget {
  final int currentStep;

  const CustomHorizontalStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStep(icon: Icons.receipt, isActive: currentStep >= 0),
        _buildDottedLine(isActive: currentStep >= 1),
        _buildStep(icon: Icons.local_dining, isActive: currentStep >= 1),
        _buildDottedLine(isActive: currentStep >= 2),
        _buildStep(
          icon: Icons.delivery_dining,
          isActive: currentStep >= 2,
          color: Colors.pink,
        ),
        _buildDottedLine(isActive: currentStep >= 3, color: Colors.pink),
        _buildStep(
          icon: Icons.check_circle,
          isActive: currentStep >= 3,
          color: Colors.pink,
        ),
      ],
    );
  }

  Widget _buildStep({
    required IconData icon,
    required bool isActive,
    Color color = secondaryColor,
  }) {
    return Icon(icon, color: isActive ? color : primaryColor, size: 30);
  }

  Widget _buildDottedLine({required bool isActive, Color color = Colors.blue}) {
    return Expanded(
      child: Row(
        children: List.generate(
          10,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? color : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
