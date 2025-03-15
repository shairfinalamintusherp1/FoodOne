import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:foodone/res/commonWidgets.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection); // Listen for tab changes
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  // Handle tab selection
  void _handleTabSelection() {
    setState(() {}); // Update UI when tab changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText(
          'Foodi Station',
          size: 20,
          fontWeigth: FontWeight.bold,
          color: whiteColor,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent, // Hide the default indicator
              ),
              labelColor: whiteColor,

              dividerColor: Colors.transparent,

              tabs: [
                // Order Notification Tab
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        _tabController.index == 0
                            ? primaryColor
                            : secondaryColor, // Dynamic color based on selection
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                            "1 ",
                            size: 16,
                            color: whiteColor,
                            fontWeigth: FontWeight.bold,
                          ),
                          Icon(Icons.notifications_active, color: whiteColor),
                        ],
                      ),
                      commonText(
                        "Order Notification",
                        size: 16,
                        color: whiteColor,
                        fontWeigth: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                // Ordered Tab
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        _tabController.index == 1
                            ? primaryColor
                            : secondaryColor, // Dynamic color based on selection
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                            "1 ",
                            size: 16,
                            color: whiteColor,
                            fontWeigth: FontWeight.bold,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                            ),
                            child: FittedBox(
                              child: Icon(
                                Icons.done_rounded,
                                color: secondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      commonText(
                        "Ordered",
                        size: 16,
                        color: whiteColor,
                        fontWeigth: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Content for Order Notification Tab
                  buildOrderNotificationTab(context),

                  // Content for Ordered Tab
                  buildOrderedTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderNotificationTab(BuildContext context) {
    return Card(
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        commonText("5 minutes ago"),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: commonButton(
                            text: "Accept",
                            onPressedButton: () {
                              showAcceptDialog(context);
                            },
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: commonButton(
                            text: "Cancel",
                            height: 40,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      commonText(
                        'Order No: #JFUJ000',
                        size: 16,
                        fontWeigth: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                      SizedBox(height: 10),
                      commonText(
                        'Time: 19 Feb 2025, 0:2:20',
                        size: 14,
                        color: textSecondaryColor,
                      ),
                      SizedBox(height: 10),
                      commonText(
                        'Payment Method: Cash on delivery',
                        size: 14,
                        color: textSecondaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderedTab(BuildContext context) {
    return Card(
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        commonText("5 minutes ago"),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: commonButton(
                            text: "Accepted",
                            onPressedButton: () {},
                            height: 40,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      commonText(
                        'Order No: #JFUJ000',
                        size: 16,
                        fontWeigth: FontWeight.bold,
                        color: textPrimaryColor,
                      ),
                      SizedBox(height: 10),
                      commonText(
                        'Time: 19 Feb 2025, 0:2:20',
                        size: 14,
                        color: textSecondaryColor,
                      ),
                      SizedBox(height: 10),
                      commonText(
                        'Payment Method: Cash on delivery',
                        size: 14,
                        color: textSecondaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAcceptDialog(BuildContext context) {
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
            size: 16,
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
                Navigator.of(context).pop(); // Close the dialog
                print('Order accepted successfully');
                // Add your logic here to handle order acceptance
              },
              child: commonText('Continue'),
            ),
          ],
        );
      },
    );
  }
}
