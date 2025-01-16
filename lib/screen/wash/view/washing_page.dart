import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/color/color.dart';
import '../../../core/widget/map/map_sreen.dart';
import '../../check_out/view/check_out_page.dart';

class WashingPage extends StatefulWidget {
  const WashingPage({ Key? key }) : super(key: key);

  @override
  _WashingPageState createState() => _WashingPageState();
}

class _WashingPageState extends State<WashingPage> {
  String serviceType = 'Delivery pick up'; // Default selected service
  String productReadyOption = 'In door delivery'; // Default selected option
  DateTime? selectedDate; // Stores the selected date
  TextEditingController noteController = TextEditingController();

  // Method to show date picker
  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          'Schedule Order',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Address Section
              const Text(
                'Street 321, Toul Tumpung, Phnom Penh',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                },
                child: const Text(
                  'Change Location',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              // SizedBox(height: 5),

              // Service Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Service',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add new service logic
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Wash Only',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Delivery Options
              Row(
                children: [
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'Delivery pick up',
                    groupValue: serviceType,
                    onChanged: (value) {
                      setState(() {
                        serviceType = value!;
                      });
                    },
                  ),
                  const Text('Delivery pick up'),
                  const SizedBox(width: 16),
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'Drop off',
                    groupValue: serviceType,
                    onChanged: (value) {
                      setState(() {
                        serviceType = value!;
                      });
                    },
                  ),
                  const Text('Drop off'),
                ],
              ),
              const SizedBox(height: 16),

              // Date Picker
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: selectedDate == null
                          ? 'Choose Date'
                          : DateFormat('yyyy-MM-dd').format(selectedDate!),
                      suffixIcon: const Icon(Icons.calendar_month),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Ready Product Options
              const Text(
                'When product is ready, do you want to:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'In door delivery',
                    groupValue: productReadyOption,
                    onChanged: (value) {
                      setState(() {
                        productReadyOption = value!;
                      });
                    },
                  ),
                  const Text('In door delivery'),
                  const SizedBox(width: 16),
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'Self-pick up',
                    groupValue: productReadyOption,
                    onChanged: (value) {
                      setState(() {
                        productReadyOption = value!;
                      });
                    },
                  ),
                  const Text('Self-pick up'),
                ],
              ),
              const SizedBox(height: 16),
              Text("Note"),
              const SizedBox(height: 16),
              // Note Section
              TextField(
                controller: noteController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Write your note or remark here.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Continue Button
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
              if (selectedDate == null) {
                // Handle no date selected
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please select a date'),
                ));
              } else {
                // Continue logic here
                print('Service: $serviceType');
                print('Product Ready Option: $productReadyOption');
                print('Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}');
                print('Note: ${noteController.text}');
              }
            },
            child: const Text('Continue', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
