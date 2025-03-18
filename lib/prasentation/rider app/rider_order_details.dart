// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider%20app/rider_order_traking_page.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderOrderDetailsPage extends StatefulWidget {
  const RiderOrderDetailsPage({super.key});

  @override
  State<RiderOrderDetailsPage> createState() => _RiderOrderDetailsPageState();
}

class _RiderOrderDetailsPageState extends State<RiderOrderDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Refresh UI when tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: commonText(
          "Orders Details",
          size: 21.0,
          fontWeigth: FontWeight.bold,
          color: Colors.white,
        ),

        flexibleSpace: ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(height: 140.0, color: primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: whiteColor,
              dividerColor: Colors.transparent,
              tabs: [
                commonButton(
                  text: "Details",
                  textColor: Colors.white,
                  fontWeigth: FontWeight.w500,
                ),
                commonButton(
                  text: "Update Tracking",
                  color: Colors.white,
                  borderColor: primaryColor,
                  textColor: primaryColor,
                  fontWeigth: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [detailsPage(), buildOrderTracking()],
              ),
            ),
          ],
        ),
      ),

      bottomSheet: priceDetails(),
    );
  }

  Widget detailsPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Order Details
          Row(
            children: [
              Expanded(
                child: buildRichText(
                  "Order No:  ",
                  "#JFUJ000",
                  color: primaryColor,
                  isBold: true,
                ),
              ),
              commonText("\$20.0", size: 14.0, fontWeigth: FontWeight.w600),
            ],
          ),
          buildRichText("Order Accepted", ""),
          buildRichText("Time:  ", "19 Feb 2025, 02:20"),
          buildRichText("Payment Method:  ", "Cash on delivery"),
          const Divider(height: 30.0),

          /// Customer Location
          sectionTitle(Icons.location_on, "Customer Location"),
          Stack(
            children: [
              InkWell(
                onTap: () {
                  commonNavigation(context, pageName: RiderOrderTrackingPage());
                },
                child: cardDesign(
                  "Habib Khan",
                  "Sultan's Dine - 16, Ranibazar, Rajshahi 6100, Bangladesh",
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIpKDxZRwlC6IN-Kmuz3rxqnch3opGTzG4pA&s",
                    width: 120.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                right: 10,
                child: Icon(Icons.location_on_sharp, color: primaryColor),
              ),
            ],
          ),

          /// Shop Details
          sectionTitle(Icons.storefront_outlined, "Shop Details"),
          cardDesign(
            "Sultan’s Dine",
            "Sultan's Dine - 16, Ranibazar, Rajshahi 6100, Bangladesh",
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIpKDxZRwlC6IN-Kmuz3rxqnch3opGTzG4pA&s",
              width: 120.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),

          /// Ordered Food
          sectionTitle(Icons.fastfood_sharp, "Ordered Food"),
          foodCard(
            "Burger",
            "\$20.00",
            "\$20.00 x1 = 20.00",
            "2 hours ago",
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIpKDxZRwlC6IN-Kmuz3rxqnch3opGTzG4pA&s",
              width: 120.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),

          /// Contact Number
          sectionTitle(Icons.phone, "Contact Number"),
          contactCard(),
          const SizedBox(height: 180.0),
        ],
      ),
    );
  }

  Widget buildOrderTracking() {
    final List<Map<String, dynamic>> orderStatusList = [
      {"status": "Order Pending", "isCompleted": true},
      {"status": "Order Accept", "isCompleted": true},
      {"status": "Order Process", "isCompleted": false},
      {"status": "On The Way", "isCompleted": false},
      {"status": "Order Completed", "isCompleted": false},
      {"status": "Cancel", "isCompleted": false},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order Status Tracking
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children:
                  orderStatusList.asMap().entries.map((entry) {
                    return buildOrderStatusItem(
                      entry.value["status"],
                      entry.value["isCompleted"],
                      entry.key !=
                          orderStatusList.length - 1, // Show line except last
                    );
                  }).toList(),
            ),
          ),

          SizedBox(height: 10.0),
          commonTextField(
            text: "Reason for cancellation",
            maxLine: 5,
            color: primaryColor,
          ),
          SizedBox(height: 10.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              commonButton(
                text: "Done",
                width: 100.0,
                height: 50.0,
                textColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 180.0),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget buildOrderStatusItem(String status, bool isCompleted, bool hasLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: isCompleted ? Colors.pink : Colors.grey,
              child: Icon(Icons.check, size: 12, color: Colors.white),
            ),
            if (hasLine) Container(width: 2, height: 40.0, color: Colors.grey),
          ],
        ),
        SizedBox(width: 10),
        commonText(status),
      ],
    );
  }

  /// Section Title
  Widget sectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          const SizedBox(width: 8),
          commonText(title, size: 18, fontWeigth: FontWeight.w500),
        ],
      ),
    );
  }

  Widget buildRichText(
    String label,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ), // Default text style
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ), // Bold label
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: (isBold) ? FontWeight.bold : FontWeight.normal,
              ), // Normal value
            ),
          ],
        ),
      ),
    );
  }

  /// Location Card
  Widget cardDesign(String name, String address, Widget icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: icon),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(name, fontWeigth: FontWeight.bold, size: 14),
                commonText(address, color: textPrimaryLightColor, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Ordered Food Card
  Widget foodCard(
    String name,
    String price,
    String details,
    String time,
    icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(10), child: icon),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(name, fontWeigth: FontWeight.bold, size: 14),
                    commonText(details, color: textPrimaryLightColor, size: 12),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 10,
            child: commonText(price, fontWeigth: FontWeight.bold, size: 14),
          ),
          Positioned(
            right: 10,
            bottom: 0,
            child: commonText(time, color: textPrimaryLightColor),
          ),
        ],
      ),
    );
  }

  /// Contact Card
  Widget contactCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.headset_mic, color: Colors.pink),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    "Call your support",
                    fontWeigth: FontWeight.bold,
                    size: 14,
                  ),
                  commonText("055*********", color: textPrimaryLightColor),
                ],
              ),
            ],
          ),
          const Icon(Icons.phone, color: Colors.pink),
        ],
      ),
    );
  }

  /// Price Details
  Widget priceDetails() {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          orderInfoRow("Total", "\$20.00"),
          orderInfoRow("Delivery Charge", "\$10.00"),
          SizedBox(height: 8),
          const Divider(color: Colors.white),
          orderInfoRow("Sub Total", "\$30.00"),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget orderInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(
            title,
            size: 14,
            fontWeigth: FontWeight.w500,
            color: Colors.white,
          ),
          commonText(
            title,
            size: 14,
            fontWeigth: FontWeight.w500,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
