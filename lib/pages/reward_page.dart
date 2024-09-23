import 'package:flutter/material.dart';

class RewardSectionPage extends StatefulWidget {
  @override
  _RewardSectionPageState createState() => _RewardSectionPageState();
}

class _RewardSectionPageState extends State<RewardSectionPage>
    with SingleTickerProviderStateMixin {
  // Hardcoded wallet balance for demonstration
  final double walletBalance = 1500.0;
  final int rewardPoints = 350;
  final int nextMilestone = 500;

  bool _visible = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Trigger the animation after the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _visible = true;
      });
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
        title: Text('Rewards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 800),
              child: _buildWalletBalanceAndPointsCard(),
            ),
            SizedBox(height: 20),
            _buildActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletBalanceAndPointsCard() {
    double progress = rewardPoints / nextMilestone;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Wallet Balance',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee,
                            color: Colors.green, size: 24),
                        SizedBox(width: 5),
                        Text(
                          '$walletBalance',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reward Points',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.grain, color: Colors.brown, size: 24),
                        SizedBox(width: 5),
                        Text(
                          '$rewardPoints',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: Colors.blue,
              minHeight: 8,
            ),
            SizedBox(height: 10),
            Text(
              '${(progress * 100).toStringAsFixed(1)}% towards next reward milestone ($nextMilestone points)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionsSection() {
    return Expanded(
      child: ListView(
        children: [
          _buildActionTile(
            icon: Icons.shopping_cart,
            title: 'Redeem Rewards',
            subtitle: 'Use your points to get exciting rewards',
            onTap: () {
              // Implement navigation to redeem rewards page
            },
          ),
          _buildActionTile(
            icon: Icons.history,
            title: 'Transaction History',
            subtitle: 'View your past transactions',
            onTap: () {
              // Implement navigation to transaction history page
            },
          ),
          _buildActionTile(
            icon: Icons.help_outline,
            title: 'How to Earn Points',
            subtitle: 'Learn how to earn more points',
            onTap: () {
              // Implement navigation to how to earn points page
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: ListTile(
          leading: Icon(icon, size: 32, color: Colors.blue),
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.chevron_right, color: Colors.grey),
        ),
      ),
    );
  }
}
