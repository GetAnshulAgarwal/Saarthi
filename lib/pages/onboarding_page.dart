import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'Buyer/login_page.dart';
import 'Farmer/login_page.dart'; // Buyer login page

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Image.asset(
                    'assets/onboarding.png'), // Replace with actual image
              ),
              const Spacer(),
              Text('Welcome to Bhoo_Saarthi',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "Get your agriculture products from the comfort of your home.",
                  textAlign: TextAlign.center,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  // Navigate to Buyer login page
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const BuyerLoginPage()));
                },
                icon: const Icon(IconlyLight.login),
                label: const Text("Login as Buyer"),
              ),
              const SizedBox(height: 15),
              FilledButton.tonalIcon(
                onPressed: () {
                  // Navigate to Farmer login page
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const FarmerLoginPage()));
                },
                icon: const Icon(IconlyLight.login),
                label: const Text("Login as Farmer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
