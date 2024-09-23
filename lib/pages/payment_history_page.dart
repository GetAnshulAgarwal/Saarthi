import 'package:flutter/material.dart';
import 'homescreen_page.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  int _selectedIndex = 3; // Set the initial selected index to Payment History

  // Sample data for the payment history
  final List<Map<String, String>> paymentHistory = [
    {'deal': 'Deal 1', 'status': 'Completed'},
    {'deal': 'Deal 2', 'status': 'Pending'},
    {'deal': 'Deal 3', 'status': 'In Progress'},
    {'deal': 'Deal 4', 'status': 'Completed'},
    {'deal': 'Deal 5', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.history),
            SizedBox(width: 10),
            Text('Payment History'),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const HomePage()), // Navigate to home screen
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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemCount: paymentHistory.length,
        itemBuilder: (context, index) {
          final payment = paymentHistory[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              title: Text(
                payment['deal']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Status: ${payment['status']}'),
              trailing: Icon(
                payment['status'] == 'Completed'
                    ? Icons.check_circle
                    : payment['status'] == 'Pending'
                        ? Icons.pending
                        : Icons.hourglass_empty,
                color: payment['status'] == 'Completed'
                    ? Colors.green
                    : payment['status'] == 'Pending'
                        ? Colors.orange
                        : Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
