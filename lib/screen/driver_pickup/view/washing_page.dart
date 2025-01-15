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
        title: const Text('Order Status'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // -- Header container
          Container(
            padding: const EdgeInsets.all(16),
            color: primaryColor,
            child: Row(
              children: [
                const Icon(Icons.local_laundry_service, color: Colors.white),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Order #12345',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'Estimated completion: 2 hours',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // -- Stepper
          Expanded(
            child: Stepper(
              currentStep: _currentStep,
              // Use ControlsDetails instead of controller
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox.shrink();
              },
              steps: [
                Step(
                  // Move the icon inside the title
                  title: Row(
                    children: [
                      Icon(
                        Icons.local_shipping,
                        color: _currentStep >= 0 ? primaryColor : Colors.grey,
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
                  state: _currentStep >= 0 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: Row(
                    children: [
                      Icon(
                        Icons.wash,
                        color: _currentStep >= 1 ? primaryColor : Colors.grey,
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
                  state: _currentStep >= 1 ? StepState.complete : StepState.indexed,
                ),
                Step(
                  title: Row(
                    children: [
                      Icon(
                        Icons.delivery_dining,
                        color: _currentStep >= 2 ? primaryColor : Colors.grey,
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
                  state: _currentStep >= 2 ? StepState.complete : StepState.indexed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
