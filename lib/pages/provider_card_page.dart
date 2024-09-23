import 'package:flutter/material.dart';
import 'provider_details_page.dart';
import 'chat_page.dart';

class ProviderCard extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const ProviderCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  _ProviderCardState createState() => _ProviderCardState();
}

class _ProviderCardState extends State<ProviderCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the fade-in animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Transform.scale(
        scale: _scale,
        child: GestureDetector(
          onTapDown: (_) {
            setState(() {
              _scale = 0.95; // Scale down
            });
          },
          onTapUp: (_) {
            setState(() {
              _scale = 1.0; // Scale back
            });
          },
          onTapCancel: () {
            setState(() {
              _scale = 1.0; // Scale back
            });
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProviderDetailPage(
                  name: widget.name,
                  price: widget.price,
                  image: widget.image,
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Hero(
                    tag: widget.name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.price,
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
                                  ChatPage(providerName: widget.name),
                            ),
                          );
                        },
                        child: const Text('Chat'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
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
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
