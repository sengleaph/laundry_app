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
      home: OpenScreen(),
    );
  }
}
