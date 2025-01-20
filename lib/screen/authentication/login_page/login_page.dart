import 'package:flutter/material.dart';
import 'package:laundry_app/screen/home_screen/view/home_screen.dart';

import '../../../core/utils/color/color.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Background Section with image
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/laundry_machine.jpg'), // Replace with your asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Welcome Back Text
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Welcome Back Text
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Login Form
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Phone Number Field
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: '012 234 567',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Password Field
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Social Login Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Add forgot password navigation
                                },
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add email login navigation
                                },
                                child: const Text(
                                  'Use email, instead',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Center(
                            child: Column(
                              children: [
                                Text('Or continue with'),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/images/google.png',
                                        height: 50,
                                      ), // Replace with your Google icon
                                      iconSize: 40,
                                      onPressed: () {
                                        // Add Google login logic here
                                      },
                                    ),
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/images/facebook.png',
                                        height: 50,
                                      ), // Replace with your Facebook icon
                                      iconSize: 40,
                                      onPressed: () {
                                        // Add Facebook login logic here
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100),

                          // Log in Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()));
                              },
                              child: Text('Checkout',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Sign up Option
                          Center(
                            child: TextButton(
                              onPressed: () {
                                // Add sign-up navigation here
                              },
                              child: Text.rich(
                                TextSpan(
                                  text: "Don’t have an account? ",
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "Sign up",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
          
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
