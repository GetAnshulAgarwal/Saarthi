import 'package:bhoo_saarthi/pages/crop_request_page.dart';
import 'package:bhoo_saarthi/pages/marketplace_page.dart'; // Import the MarketplacePage
import 'package:bhoo_saarthi/pages/payment_history_page.dart'; // Import the PaymentHistoryPage
import 'package:bhoo_saarthi/pages/onboarding_page.dart'; // Import your OnboardingPage or similar page
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4; // Set the initial selected index to Profile

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Avoid unnecessary rebuilds

    setState(() {
      _selectedIndex = index;
    });

    Widget page; // Declare the variable

    switch (index) {
      case 0:
        page = const MarketplacePage();
        break;
      case 1:
        // Navigate to Services Page (Add the actual page when implemented)
        return; // Skip for now
      case 2:
        page = const CropRequestPage(); // Navigate to CropRequestPage
        break;
      case 3:
        page = const PaymentHistoryPage(); // Navigate to PaymentHistoryPage
        break;
      case 4:
        page = const ProfilePage(); // Stay on ProfilePage
        break;
      default:
        page = const MarketplacePage(); // Fallback
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _logout() {
    // Navigate back to the onboarding page and clear the navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPage()),
      (Route<dynamic> route) => false, // This clears all the previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Profile'),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage('assets/profile_picture.png'),
              ),
            ),
          ),
          Center(
            child: Text(
              "Anshul Agarwal",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "anshulagarwal136@gmail.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: () {
              // Handle About Us tap
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(IconlyLight.logout),
            onTap: _logout, // Call the logout function
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Update currentIndex to ProfilePage
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
