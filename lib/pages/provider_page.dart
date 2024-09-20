import 'package:bhoo_saarthi/pages/provider_details_page.dart';
import 'package:flutter/material.dart';
import 'chat_page.dart';

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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProviderDetailPage(
                    name: provider['name']!,
                    price: provider['price']!,
                    image: provider['image']!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        provider['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider['name']!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            provider['price']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatPage(providerName: provider['name']!),
                              ),
                            );
                          },
                          child: const Text('Chat'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white, // Button color
                            side: const BorderSide(
                                color: Colors.black), // Border color
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            // Handle Buy button press
                          },
                          child: const Text('Buy'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white, // Button color
                            side: const BorderSide(
                                color: Colors.black), // Border color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
