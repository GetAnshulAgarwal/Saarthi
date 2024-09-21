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
    );
  }
}
