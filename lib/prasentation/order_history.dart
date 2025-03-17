import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider_order_details.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class RiderOrderHistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "time": "5 minutes ago",
      "orderNo": "#JFUJ000",
      "date": "19 Feb 2025, 0:2:20",
      "payment": "Cash on delivery",
      "amount": "\$20.00",
      "status": "Completed",
    },
    {
      "time": "5 minutes ago",
      "orderNo": "#JFUJ000",
      "date": "19 Feb 2025, 0:2:20",
      "payment": "Cash on delivery",
      "amount": "\$20.00",
      "status": "Canceled",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(height: 140.0, color: primaryColor),
        ),

        title: commonText(
          "Orders History",
          size: 21.0,
          fontWeigth: FontWeight.w500,
          color: whiteColor,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 4.0),
        padding: EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return buildOrderCard(context, orders[index]);
        },
      ),
    );
  }

  // Builds each order card dynamically
  Widget buildOrderCard(BuildContext context, Map<String, dynamic> order) {
    return InkWell(
      onTap: () {
        commonNavigation(context, pageName: OrderDetailsPage());
      },
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.only(bottom: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.black),
                      SizedBox(width: 5.0),
                      commonText(order['time'], color: Colors.black),
                      Spacer(),
                      buildStatusButton(order['status']),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildRichText(
                        'Order No: ',
                        order['orderNo'],
                        isBold: true,
                        color: primaryColor,
                      ),
                      SizedBox(height: 8.0),
                      buildRichText('Time: ', order['date']),
                      SizedBox(height: 8.0),
                      buildRichText('Payment Method: ', order['payment']),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            right: 20,
            child: commonText(
              order['amount'],
              size: 18.0,
              fontWeigth: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Status Button Styling using commonButton
  Widget buildStatusButton(String status) {
    Color bgColor = status == "Completed" ? secondaryColor : primaryColor;
    return commonButton(
      text: status,
      width: 100.0,
      height: 40.0,
      fontSize: 12.0,
      color: bgColor,
      textColor: Colors.white,
    );
  }

  // Rich Text for Labels using commonText
  Widget buildRichText(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 12.0, color: color ?? Colors.black),
        children: [
          TextSpan(
            text: label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}
