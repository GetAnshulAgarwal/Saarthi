import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bhoo_saarthi/pages/onboarding_page.dart'; // Assuming you have an OnboardingPage
import 'firebase_options.dart'; // Firebase options created by `flutterfire configure`

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Use the Firebase options created
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhoo Saarthi',
      home: OnboardingPage(),
    );
  }
}
