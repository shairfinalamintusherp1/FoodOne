import 'package:flutter/material.dart';
import 'package:foodone/prasentation/rider%20app/rider_order_history.dart';
import 'package:foodone/prasentation/rider%20app/rider_dashboard_page.dart';
import 'package:foodone/prasentation/rider%20app/rider_profile.dart';
import 'package:foodone/prasentation/rider%20app/rider_withdraw.dart';
import 'package:foodone/res/color.dart';

class RiderRootPage extends StatefulWidget {
  @override
  _RiderRootPageState createState() => _RiderRootPageState();
}

class _RiderRootPageState extends State<RiderRootPage> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of pages to display for each tab
  final List<Widget> _pages = [
    RiderDashboardPage(), // Replace with your Dashboard page
    RiderOrderHistoryPage(), RiderWithdraw(), RiderProfilePage(),
  ];

  // Handle tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: primaryColor, // Selected tab color
        unselectedItemColor: textSecondaryColor, // Unselected tab color
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.dashboard : Icons.dashboard_outlined,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Icons.history : Icons.history_outlined,
            ),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.account_balance_wallet
                  : Icons.account_balance_wallet_outlined,
            ),
            label: 'Withdraw',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
