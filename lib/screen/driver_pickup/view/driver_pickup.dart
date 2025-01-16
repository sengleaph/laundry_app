import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/utils/color/color.dart';

class DriverPickupScreen extends StatefulWidget {
  const DriverPickupScreen({Key? key}) : super(key: key);

  @override
  _DriverPickupScreenState createState() => _DriverPickupScreenState();
}

class _DriverPickupScreenState extends State<DriverPickupScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Driver is picking up!",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Details Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jessica Sun (012775538)",
                          style: TextStyle(
                            color: dark_colors,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Toul Tumpung, Phnom Penh",
                          style: TextStyle(fontSize: 14, color: dark_colors),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Map icon action
                    },
                    icon: const Icon(Icons.location_pin, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Will Arrive Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.pink),
                      SizedBox(width: 8),
                      Text(
                        "Will arrive at 20:53",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Arrow icon action
                    },
                    icon: const Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.pink),
                  ),
                ],
              ),
              const Divider(),

              // Order Details Section
              const Text(
                "Order Detail",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Order Image

                    // Order Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "Order #12",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: dark_colors
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Service: Wash & Iron\nDelivery pickup: 26 Dec 2025 3:30PM\nWhen product is ready, in door delivery",
                            style: TextStyle(fontSize: 12, color: dark_colors),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.asset(
                      'assets/images/Iron.png', // Replace with your image path
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Timeline Section with Stepper
              SizedBox(
                height: 300, // Fixed height for the Stepper
                child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (step) {
                    setState(() {
                      _currentStep = step;
                    });
                  },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return const SizedBox.shrink(); // Hides default controls
                  },
                  steps: [
                    Step(
                      title: Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color:
                                _currentStep >= 0 ? primaryColor : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          const Text('Driver Pick Up'),
                        ],
                      ),
                      subtitle: const Text('16 Jul, 20:53'),
                      content: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Your laundry is being picked up'),
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: Row(
                        children: [
                          Icon(
                            Icons.wash,
                            color:
                                _currentStep >= 1 ? primaryColor : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          const Text('Job in Progress'),
                        ],
                      ),
                      subtitle: const Text('16 Jul, 19:57'),
                      content: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Your laundry is being processed'),
                      ),
                      isActive: _currentStep >= 1,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: Row(
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color:
                                _currentStep >= 2 ? primaryColor : Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          const Text('Ready for Delivery'),
                        ],
                      ),
                      subtitle: const Text('16 Jul, 19:53'),
                      content: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Your laundry is ready for delivery'),
                      ),
                      isActive: _currentStep >= 2,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
