import 'package:flutter/material.dart';
import 'package:laundry_app/core/utils/color/color.dart';
import 'package:laundry_app/screen/bulky_items/view/bulky_items.dart';
import 'package:laundry_app/screen/dry_cleaning/view/dry_cleaning.dart';
import 'package:laundry_app/screen/duvets/view/duvets.dart';
import 'package:laundry_app/screen/home_screen/view/widget/promotion_cart.dart';
import 'package:laundry_app/screen/shoes_other/view/shoes_and_other.dart';

import '../../wash_and_iron/view/wash_and_iron.dart';
import '../../wash/view/washing_page.dart'; // Ensure this path is correct

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgData = [
    "assets/images/Washing_Machine.png",
    "assets/images/Iron.png",
    "assets/images/spray.png",
    "assets/images/bulky.png",
    "assets/images/Bed.png",
    "assets/images/Shoes.png",
  ];

  List titles = [
    "Washing",
    "Wash and Iron",
    "Dry Cleaning",
    "Bulky Items",
    "Duvets",
    "Shoes and Others",
  ];

  List discription = [
    '1200៛/kg',
    '1500៛/kg',
    '2000៛/kg',
    '2500៛/kg',
    '3000៛/kg',
    '3500៛/kg',
  ];

  List navigating = [
    const WashingPage(),
    ScheduleOrderScreen(), // Add corresponding pages here
    DryCleaning(), // Add corresponding pages here
    BulkyItems(), // Add corresponding pages here
    Duvets(), // Add corresponding pages here
    ShoesAndOther(), // Add corresponding pages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // overlayColor: MaterialStateProperty.all(Colors.transparent),
      backgroundColor: Colors.white,// Ensure this variable is defined
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/boy.png',
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning,',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Jessica!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 9,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/notification.png',
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: background_secondary,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: secondaryColor.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: background_primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: primaryColor,
                          size: 40,
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Your Laundry is finished!\nIt is being delivered to you 📦',
                        style: TextStyle(fontSize: 14, color: primaryColor),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Services Section
              const Text(
                'Services',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Disable internal scrolling of the GridView
                shrinkWrap:
                    true, // Allows the GridView to adjust its height dynamically
                itemCount: imgData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index < navigating.length &&
                          navigating[index] != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navigating[index],
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Page not implemented yet!'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 9,
                            spreadRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imgData[index],
                            height: 100,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            titles[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            discription[index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Promotions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return PromotionCart();
                  },
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
