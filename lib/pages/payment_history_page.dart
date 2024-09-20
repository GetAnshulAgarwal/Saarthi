import 'package:bhoo_saarthi/pages/crop_request_page.dart';
import 'package:bhoo_saarthi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'contract_page.dart';
import 'marketplace_page.dart'; // Import the MarketplacePage

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  int _selectedIndex = 3; // Set the initial selected index to Payment History

  // Sample data for the payment history
  final List<Map<String, String>> paymentHistory = [
    {'deal': 'Deal 1', 'status': 'Completed'},
    {'deal': 'Deal 2', 'status': 'Pending'},
    {'deal': 'Deal 3', 'status': 'In Progress'},
    {'deal': 'Deal 4', 'status': 'Completed'},
    {'deal': 'Deal 5', 'status': 'Pending'},
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Avoid unnecessary rebuilds

    setState(() {
      _selectedIndex = index;
    });

    Widget page;

    switch (index) {
      case 0:
        page = const MarketplacePage();
        break;
      case 1:
        page = const ContractHistoryPage(); // Use ContractHistoryPage
        break;
      case 2:
        page = const CropRequestPage(); // CropRequestPage
        break;
      case 3:
        page = const PaymentHistoryPage(); // Stay on Payment History Page
        break;
      case 4:
        page = const ProfilePage();
        break;
      default:
        page = const MarketplacePage(); // Fallback
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.history),
            SizedBox(width: 10),
            Text('Payment History'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MarketplacePage()), // Navigate to home screen
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification icon pressed
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: paymentHistory.length,
        itemBuilder: (context, index) {
          final payment = paymentHistory[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                payment['deal']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Status: ${payment['status']}'),
              trailing: Icon(
                payment['status'] == 'Completed'
                    ? Icons.check_circle
                    : payment['status'] == 'Pending'
                        ? Icons.pending
                        : Icons.hourglass_empty,
                color: payment['status'] == 'Completed'
                    ? Colors.green
                    : payment['status'] == 'Pending'
                        ? Colors.orange
                        : Colors.blue,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedIndex, // Update currentIndex to PaymentHistoryPage
        backgroundColor: Colors.white, // Set the background to white
        type: BottomNavigationBarType.fixed, // Fixed type for equal spacing
        elevation: 10, // Slight elevation for a subtle shadow effect
        showSelectedLabels: true, // Show labels
        showUnselectedLabels: false, // Hide labels
        selectedItemColor: Colors.black, // Color of the selected icon
        unselectedItemColor: Colors.grey, // Color of the unselected icons
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.bag), // Services icon
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.addUser), // Schedule icon
            label: 'Crop Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.wallet), // Payment History icon
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), // Profile icon
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped, // Handle bottom navigation tap
      ),
    );
  }
}
