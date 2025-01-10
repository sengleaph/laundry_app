import 'package:flutter/material.dart';
import 'package:laundry_app/core/widget/splash_welcom/open_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white, // Fixed white color
          elevation: 0, // No shadow
          iconTheme: IconThemeData(color: Colors.black), // Black icons
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        scaffoldBackgroundColor: Colors.white, // Consistent scaffold background
      ),
      home: const OpenScreen(),
    );
  }
}
