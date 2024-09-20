import 'package:flutter/material.dart';
import 'provider_page.dart'; // Import the provider page

class CropDescriptionPage extends StatelessWidget {
  final String imagePath;
  final String cropName;
  final String cropDetails;

  const CropDescriptionPage({
    Key? key,
    required this.imagePath,
    required this.cropName,
    required this.cropDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cropName),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    cropName,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Room No: $cropDetails',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                      height: 60), // Space to avoid overlap with button
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProviderScreen(), // Navigate to ProviderPage
                    ),
                  );
                },
                child: const Text(
                  'Providers',
                  style: TextStyle(fontSize: 20), // Adjust font size
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white, // Button color
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
