import 'package:bhoo_saarthi/pages/provider_card_page.dart';
import 'package:flutter/material.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> providers = [
      {
        'name': 'Ramesh Kumar',
        'price': 'RS - 50/KG',
        'image': 'assets/farmers.jpg',
      },
      {
        'name': 'Sita Devi',
        'price': 'RS - 45/KG',
        'image': 'assets/farmers.jpg',
      },
      {
        'name': 'Ajay Singh',
        'price': 'RS - 55/KG',
        'image': 'assets/farmers.jpg',
      },
      {
        'name': 'Sunita Rani',
        'price': 'RS - 60/KG',
        'image': 'assets/farmers.jpg',
      },
      {
        'name': 'Vikram Patel',
        'price': 'RS - 45/KG',
        'image': 'assets/farmers.jpg',
      },
      {
        'name': 'Mohit Kumar',
        'price': 'RS - 40/KG',
        'image': 'assets/farmers.jpg',
      },
      // Add more providers here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Providers'),
      ),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          return ProviderCard(
            name: provider['name']!,
            price: provider['price']!,
            image: provider['image']!,
          );
        },
      ),
    );
  }
}
