import 'package:flutter/material.dart';
import 'package:foodone/prasentation/order_history.dart';
import 'package:foodone/prasentation/rider_dashboard_page.dart';
import 'package:foodone/prasentation/rider_profile.dart';
import 'package:foodone/prasentation/rider_withdraw.dart';
import 'package:foodone/res/color.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0; // Index of the selected tab

  // List of pages to display for each tab
  final List<Widget> _pages = [
    DashboardPage(), // Replace with your Dashboard page
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Withdraw'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
