import 'package:flutter/material.dart';

import '../../../core/widget/payment/payment_option.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Section
            Text(
              'Street 321, Toul Tumpung, Phnom Penh',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            TextButton(
              onPressed: () {
                // Change location logic
              },
              child: Text(
                'Change Location',
                style: TextStyle(color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),

            // Order Details Section
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #12',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Service: Wash & Iron',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Delivery pickup: 26 Dec 2025 3:30PM',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'When product is ready, in door delivery',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Payment Options Section
            Text(
              'We Accept',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            SizedBox(height: 16),

            // Payment Methods
            PaymentOption(
              title: 'ABA KHQR',
              description: 'Scan to pay with any banking app',
              icon: Icons.qr_code,
              color: Colors.red.shade700,
            ),
            SizedBox(height: 12),
            PaymentOption(
              title: 'Credit/Debit Card',
              description: 'Scan to pay with Visa/MasterCard',
              
              color: Colors.blue,
            ),
            SizedBox(height: 12),
            PaymentOption(
              title: 'Alipay',
              description: 'Scan to pay with Alipay',
              icon: Icons.payment,
              color: Colors.lightBlue,
            ),
            SizedBox(height: 12),
            PaymentOption(
              title: 'WeChat',
              description: 'Scan to pay with WeChat',
              icon: Icons.chat,
              color: Colors.green,
            ),
            SizedBox(height: 24),

            // Note Section
            Text(
              'Note: The total payment will be calculated and sent to you after we receive your items. You will need to confirm the payment once you receive the notification in order for us to proceed.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.red.shade700,
              ),
            ),
            Spacer(),

            // Checkout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Checkout button logic
                },
                child: Text('Checkout'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}