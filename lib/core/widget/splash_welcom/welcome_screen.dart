import 'package:flutter/material.dart';

import '../../../screen/home_screen/view/home_screen.dart';
import '../../utils/color/color.dart';
import 'welcome_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> welcomeData = [
    {
      "title": "Welcome to Laundry App",
      "text": "Your one-stop solution for laundry services",
      "image": "assets/images/laundry_machine.png",
    },
    {
      "title": "Easy Scheduling",
      "text": "Book your laundry pickup with just a few taps",
      "image": "assets/images/shirt.png",
    },
    {
      "title": "Fast Delivery",
      "text": "Get your clean clothes delivered to your doorstep",
      "image": "assets/images/bagpag.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1,
            child: const Center(
              child: Text(
                'Spin & Shine',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),
            SizedBox(
              height: MediaQuery.of(context).size.height * .60,
              child: Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemCount: welcomeData.length,
                  itemBuilder: (context, index) => WelcomePage(
                    title: welcomeData[index]["title"]!,
                    text: welcomeData[index]["text"]!,
                    image: welcomeData[index]["image"]!,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    welcomeData.length,
                    (index) => buildDot(index: index),
                  ),
                ],
              ),
            ),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Replace with your actual next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(), // Change to your home screen
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Updated from primary
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  _currentPage == welcomeData.length - 1 ? 'Get Started' : 'Next',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
