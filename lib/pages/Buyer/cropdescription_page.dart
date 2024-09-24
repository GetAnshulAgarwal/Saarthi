import 'package:bhoo_saarthi/pages/Buyer/provider_page.dart';
import 'package:flutter/material.dart';

class CropDescriptionPage extends StatefulWidget {
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
  _CropDescriptionPageState createState() => _CropDescriptionPageState();
}

class _CropDescriptionPageState extends State<CropDescriptionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String description = _getDescriptionForCrop(widget.cropName);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/green field.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5), // Set the opacity here
            ),
          ),
          // Back Arrow Icon
          Positioned(
            top: 30, // Adjusted position to avoid overlap
            left: 6,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ),
          // Scrollable Content
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.85, // Set a maximum height
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(18.0), // Standard padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeTransition(
                        opacity: _imageAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: screenHeight * 0.25, // Responsive height
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeTransition(
                        opacity: _textAnimation,
                        child: Text(
                          widget.cropName,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeTransition(
                        opacity: _textAnimation,
                        child: Text(
                          'Room No: ${widget.cropDetails}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeTransition(
                        opacity: _textAnimation,
                        child: Text(
                          description,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildDescriptionDetail(
                        title: 'Superior Quality',
                        detail:
                            'Plump, golden grains, cleaned and processed to maintain natural goodness.',
                      ),
                      _buildDescriptionDetail(
                        title: 'Nutrient-Rich',
                        detail:
                            'Excellent source of fiber, protein, and B vitamins for a balanced diet.',
                      ),
                      _buildDescriptionDetail(
                        title: 'Versatile Use',
                        detail:
                            'Ideal for bread, pasta, pastries, and more with consistent texture and milling properties.',
                      ),
                      _buildDescriptionDetail(
                        title: 'Freshness Guaranteed',
                        detail:
                            'Strict storage and packaging standards to ensure freshness.',
                      ),
                      _buildDescriptionDetail(
                        title: 'Sustainable Farming',
                        detail:
                            'Grown using eco-friendly practices, supporting environmental health and fair trade.',
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Providers Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Standard padding
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProviderScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Providers',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionDetail(
      {required String title, required String detail}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                fontSize: 18,
              ),
            ),
            TextSpan(
              text: detail,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescriptionForCrop(String cropName) {
    switch (cropName.toLowerCase()) {
      case 'wheat':
        return 'Wheat is a staple food crop known for its versatility and high nutritional value.';
      case 'rice':
        return 'Rice is a vital food source for a large part of the world, rich in carbohydrates.';
      case 'corn':
        return 'Corn is used in various forms, from food to biofuels, and is a major agricultural product.';
      case 'barley':
        return 'Barley is a nutritious grain often used in brewing and as animal fodder.';
      default:
        return 'No description available for this crop.';
    }
  }
}
