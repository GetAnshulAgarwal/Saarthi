import 'package:bhoo_saarthi/pages/crop_request_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'marketplace_page.dart'; // Import the MarketplacePage
import 'payment_history_page.dart'; // Import the PaymentHistoryPage
import 'profile.dart'; // Import the ProfilePage

class ContractHistoryPage extends StatelessWidget {
  const ContractHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for contract history
    final contractHistory = [
      {
        'contractId': 'C001',
        'crop': 'Wheat',
        'status': 'Completed',
        'date': '2023-08-01'
      },
      {
        'contractId': 'C002',
        'crop': 'Rice',
        'status': 'Pending',
        'date': '2023-08-10'
      },
      {
        'contractId': 'C003',
        'crop': 'Maize',
        'status': 'Completed',
        'date': '2023-09-01'
      },
      {
        'contractId': 'C004',
        'crop': 'Barley',
        'status': 'In Progress',
        'date': '2023-09-15'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Contract History'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: contractHistory.length,
          itemBuilder: (context, index) {
            final contract = contractHistory[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text('Contract ID: ${contract['contractId']}'),
                subtitle: Text(
                  'Crop: ${contract['crop']}\nStatus: ${contract['status']}\nDate: ${contract['date']}',
                ),
                trailing: Icon(
                  contract['status'] == 'Completed'
                      ? Icons.check_circle
                      : contract['status'] == 'Pending'
                          ? Icons.pending
                          : Icons.hourglass_empty,
                  color: contract['status'] == 'Completed'
                      ? Colors.green
                      : contract['status'] == 'Pending'
                          ? Colors.orange
                          : Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the index to 1 for Contract History
        backgroundColor: Colors.white, // Set the background to white
        type: BottomNavigationBarType.fixed, // Fixed type for equal spacing
        elevation: 10, // Slight elevation for a subtle shadow effect
        showSelectedLabels: true, // Show labels
        showUnselectedLabels: false, // Hide unselected labels
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
            icon: Icon(IconlyLight.wallet), // Orders icon
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), // Profile icon
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation between tabs
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MarketplacePage()),
              );
              break;
            case 1:
              // Already on Contract History, do nothing
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const CropRequestPage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentHistoryPage()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
      ),
    );
  }
}
