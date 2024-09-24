import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with SingleTickerProviderStateMixin {
  final double currentBalance = 1000.00; // Hardcoded balance
  final List<Transaction> transactionHistory = [
    Transaction(date: '2024-01-01', amount: 200, type: 'Deposit'),
    Transaction(date: '2024-01-15', amount: -50, type: 'Withdrawal'),
    Transaction(date: '2024-02-01', amount: 150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: -150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: 1500, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: 150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: -150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: 150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: 150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: -150, type: 'Deposit'),
    Transaction(date: '2024-02-01', amount: 150, type: 'Deposit'),
    // Add more transactions as needed...
  ];

  late AnimationController _controller;
  late Animation<double> _balanceAnimation;
  late Animation<double> _transactionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _balanceAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _transactionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start animations after the page is built
    Future.delayed(Duration.zero, () {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FadeTransition(
              opacity: _balanceAnimation,
              child: _buildCurrentBalanceCard(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FadeTransition(
                opacity: _transactionAnimation,
                child: _buildTransactionHistory(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentBalanceCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Balance',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.currency_rupee, color: Colors.green, size: 30),
                const SizedBox(width: 5),
                Text(
                  '$currentBalance',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return ListView.builder(
      itemCount: transactionHistory.length,
      itemBuilder: (context, index) {
        final transaction = transactionHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(transaction.type),
            subtitle: Text(transaction.date),
            trailing: Text(
              '${transaction.amount >= 0 ? '+' : ''}${transaction.amount}',
              style: TextStyle(
                color: transaction.amount >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Transaction {
  final String date;
  final double amount;
  final String type;

  Transaction({required this.date, required this.amount, required this.type});
}
