import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'contract_page.dart'; // Import the ContractHistoryPage
import 'marketplace_page.dart'; // Import the MarketplacePage
import 'payment_history_page.dart'; // Import the PaymentHistoryPage
import 'profile.dart'; // Import the ProfilePage

class CropRequestPage extends StatefulWidget {
  const CropRequestPage({Key? key}) : super(key: key);

  @override
  _CropRequestPageState createState() => _CropRequestPageState();
}

class _CropRequestPageState extends State<CropRequestPage> {
  final _formKey = GlobalKey<FormState>();
  String _buyerName = '';
  String _contactInfo = '';
  String _cropType = '';
  int _quantity = 0;

  int _selectedIndex =
      2; // To keep track of the selected index for Crop Request Page

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
        page = const CropRequestPage(); // Stay on CropRequestPage
        break;
      case 3:
        page = const PaymentHistoryPage();
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

  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic here (e.g., send request to backend)

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request submitted successfully!')),
      );

      // Optionally clear the form fields
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text('Hii Anshul 👋'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Buyer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _buyerName = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Contact Info'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact information';
                  }
                  return null;
                },
                onChanged: (value) {
                  _contactInfo = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Crop Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the crop type';
                  }
                  return null;
                },
                onChanged: (value) {
                  _cropType = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
                onChanged: (value) {
                  _quantity = int.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitRequest,
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Update currentIndex
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
            label: 'Home', // Label for home
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.bag), // Services icon
            label: 'Bag', // Label for services
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.addUser), // Schedule icon
            label: 'Crop Request', // Label for schedule
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.wallet), // Orders icon
            label: 'Wallet', // Label for wallet
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile), // Profile icon
            label: 'Profile', // Label for profile
          ),
        ],
        onTap: _onItemTapped, // Update onTap method
      ),
    );
  }
}
