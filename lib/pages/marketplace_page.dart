import 'package:bhoo_saarthi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'contract_page.dart';
import 'crop_request_page.dart';
import 'cropitem_page.dart'; // Import the CropDescriptionPage
import 'payment_history_page.dart'; // Import your Payment History page

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  _MarketplacePageState createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  int _selectedIndex = 0; // Default index for the BottomNavigationBar

  // Function to handle navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Stay on the MarketplacePage
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const ContractHistoryPage()), // Replace with your actual services page
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const CropRequestPage()), // Replace with your actual schedule page
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const PaymentHistoryPage()), // Replace with your actual payment history page
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const ProfilePage()), // Replace with your actual profile page
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Hii Anshul 👋'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  CropItem(
                    imagePath: 'assets/banner1.jpg',
                    cropName: 'Wheat',
                    cropDetails: 'RS 45\nbarley',
                  ),
                  CropItem(
                    imagePath: 'assets/banner2.jpg',
                    cropName: 'Rice',
                    cropDetails: 'RS 45\nbarley',
                  ),
                  CropItem(
                    imagePath: 'assets/banner3.jpg',
                    cropName: 'Maize',
                    cropDetails: 'RS 45\nbarley',
                  ),
                  CropItem(
                    imagePath: 'assets/banner4.jpg',
                    cropName: 'Barley',
                    cropDetails: 'RS 45\nbarley ',
                  ),
                  // Add more CropItems as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the current index
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
            label: 'Home', // Label
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.bag), // Services icon
            label: 'Services', // Label
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.addUser), // Schedule icon
            label: 'Crop Request', // Label
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.wallet), // Orders icon
            label: 'Orders', // Label
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), // Profile icon
            label: 'Profile', // Label
          ),
        ],
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }
}
