import 'package:bhoo_saarthi/pages/contract_page.dart';
import 'package:bhoo_saarthi/pages/crop_request_page.dart';
import 'package:bhoo_saarthi/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bhoo_saarthi/navigation_menu.dart';
import 'marketplace_page.dart'; // Import the MarketplacePage
import 'payment_history_page.dart'; // Import the PaymentHistoryPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notification icon pressed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),

          // Carousel Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: SizedBox(
              height: 180, // Set a height for the carousel
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: [
                  'assets/banner1.jpg',
                  'assets/banner2.jpg',
                  'assets/banner3.jpg',
                  'assets/banner4.jpg',
                  'assets/banner5.jpg',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),

          // App Description Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About Our App',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome to Bhoo Saarthi! Our app provides an efficient platform for farmers and buyers to connect, negotiate, and complete transactions with ease. Explore our marketplace, manage contracts, and track your orders all in one place.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Services Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: const [
                Text(
                  "Our Services Section",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                // Add more content or services as needed here
              ],
            ),
          ),
        ],
      ),

      // Adding the common navigation bar
      bottomNavigationBar:
          NavigationMenu(), // Use the created NavigationMenu widget here
    );
  }
}
