import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  final double amount;

  PaymentSuccessPage({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Payment Successful')),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 80),
            SizedBox(height: 20),
            Text('Payment Successful!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Amount Paid: NPR $amount', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/foodmenupage');
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
