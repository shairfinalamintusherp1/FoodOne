import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider_order_details.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> orderNotifications = [
    {
      'orderNo': '#JFUJ001',
      'time': '5 minutes ago',
      'date': '19 Feb 2025, 0:2:20',
      'payment': 'Cash on delivery',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ002',
      'time': '10 minutes ago',
      'date': '19 Feb 2025, 0:5:45',
      'payment': 'Online Payment',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ001',
      'time': '5 minutes ago',
      'date': '19 Feb 2025, 0:2:20',
      'payment': 'Cash on delivery',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ002',
      'time': '10 minutes ago',
      'date': '19 Feb 2025, 0:5:45',
      'payment': 'Online Payment',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ001',
      'time': '5 minutes ago',
      'date': '19 Feb 2025, 0:2:20',
      'payment': 'Cash on delivery',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ002',
      'time': '10 minutes ago',
      'date': '19 Feb 2025, 0:5:45',
      'payment': 'Online Payment',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ001',
      'time': '5 minutes ago',
      'date': '19 Feb 2025, 0:2:20',
      'payment': 'Cash on delivery',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ002',
      'time': '10 minutes ago',
      'date': '19 Feb 2025, 0:5:45',
      'payment': 'Online Payment',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ001',
      'time': '5 minutes ago',
      'date': '19 Feb 2025, 0:2:20',
      'payment': 'Cash on delivery',
      'status': 'pending',
    },
    {
      'orderNo': '#JFUJ002',
      'time': '10 minutes ago',
      'date': '19 Feb 2025, 0:5:45',
      'payment': 'Online Payment',
      'status': 'pending',
    },
  ];

  List<Map<String, dynamic>> orderedOrders = [
    {
      'orderNo': '#JFUJ003',
      'time': '15 minutes ago',
      'date': '19 Feb 2025, 0:15:30',
      'payment': 'Cash on delivery',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ004',
      'time': '20 minutes ago',
      'date': '19 Feb 2025, 0:20:10',
      'payment': 'Credit Card',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ003',
      'time': '15 minutes ago',
      'date': '19 Feb 2025, 0:15:30',
      'payment': 'Cash on delivery',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ004',
      'time': '20 minutes ago',
      'date': '19 Feb 2025, 0:20:10',
      'payment': 'Credit Card',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ003',
      'time': '15 minutes ago',
      'date': '19 Feb 2025, 0:15:30',
      'payment': 'Cash on delivery',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ004',
      'time': '20 minutes ago',
      'date': '19 Feb 2025, 0:20:10',
      'payment': 'Credit Card',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ003',
      'time': '15 minutes ago',
      'date': '19 Feb 2025, 0:15:30',
      'payment': 'Cash on delivery',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ004',
      'time': '20 minutes ago',
      'date': '19 Feb 2025, 0:20:10',
      'payment': 'Credit Card',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ003',
      'time': '15 minutes ago',
      'date': '19 Feb 2025, 0:15:30',
      'payment': 'Cash on delivery',
      'status': 'accepted',
    },
    {
      'orderNo': '#JFUJ004',
      'time': '20 minutes ago',
      'date': '19 Feb 2025, 0:20:10',
      'payment': 'Credit Card',
      'status': 'accepted',
    },
  ];

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
        flexibleSpace: ClipPath(
          clipper: CustomAppBarClipper(),
          child: Container(height: 140.0, color: primaryColor),
        ),
        title: commonText(
          'Foodi Station',
          size: 20.0,
          fontWeigth: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,

        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelColor: whiteColor,
              tabs: [
                buildTab("Order Notification", Icons.notifications_active, 0),
                buildTab("Ordered", Icons.done_rounded, 1),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildOrderList(orderNotifications, "pending"),
                  buildOrderList(orderedOrders, "accepted"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Builds each tab with a dynamic selection
  Widget buildTab(String title, IconData icon, int index) {
    bool isSelected = _tabController.index == index;
    return Container(
      height: 80,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: isSelected ? primaryColor : secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonText(
                "${index == 0 ? orderNotifications.length : orderedOrders.length} ",
                size: 14.0,
                color: Colors.white,
                alinment: TextAlign.center,
                fontWeigth: FontWeight.bold,
              ),
              Icon(icon, color: Colors.white),
            ],
          ),
          commonText(
            title,
            size: 14.0,
            color: Colors.white,
            alinment: TextAlign.center,
            fontWeigth: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  // Builds a dynamic order list
  Widget buildOrderList(List<Map<String, dynamic>> orders, String statusType) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var order = orders[index];
        return buildOrderCard(order, statusType);
      },
    );
  }

  // Builds each order card dynamically
  Widget buildOrderCard(Map<String, dynamic> order, String statusType) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Icon(Icons.watch_later_outlined),
                  SizedBox(width: 5),
                  commonText(order['time']),
                  Spacer(),
                  if (statusType == "pending") ...[
                    Expanded(
                      child: commonButton(
                        text: "Accept",
                        onPressedButton: () {
                          showAcceptDialog(context, order);
                        },
                        height: 40.0,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: commonButton(
                        text: "Cancel",
                        height: 40.0,
                        color: secondaryColor,
                        onPressedButton: () {
                          setState(() {
                            orderNotifications.remove(order);
                          });
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: commonButton(text: "Accepted", height: 40.0),
                    ),
                  ],
                ],
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                if (statusType != "pending") {
                  commonNavigation(context, pageName: OrderDetailsPage());
                }
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRichText(
                          'Order No: ',
                          order['orderNo'],
                          isBold: true,
                          color: primaryColor,
                        ),
                        SizedBox(height: 10.0),
                        buildRichText('Time: ', order['date']),
                        SizedBox(height: 10.0),
                        buildRichText('Payment Method: ', order['payment']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRichText(
    String label,
    String value, {
    Color? color,
    bool isBold = false,
  }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12,
          color: Colors.black,
        ), // Default text style
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ), // Bold label
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: (isBold) ? FontWeight.bold : FontWeight.w500,
              color: color,

              fontSize: 12.0,
            ), // Normal value
          ),
        ],
      ),
    );
  }

  void showAcceptDialog(BuildContext context, order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: whiteColor,
          title: commonText(
            'Order Accept?',
            fontWeigth: FontWeight.bold,
            size: 14.0,
          ),
          content: commonText('Are you sure you want to confirm the order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: commonText('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  orderedOrders.add(order);
                  orderNotifications.remove(order);
                });
                print('Order accepted successfully');
              },
              child: commonText('Continue'),
            ),
          ],
        );
      },
    );
  }
}
