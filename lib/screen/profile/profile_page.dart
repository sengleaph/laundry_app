import 'package:flutter/material.dart';
import 'package:laundry_app/core/utils/color/color.dart';

import '../../core/widget/profile/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: primaryColor, // Blue background
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  // Profile Avatar
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/boy.png",
                        ),),
                  ),
                  const SizedBox(width: 16),
                  // Name and Address
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jessica Sun",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Toul Tumpung, Phnom Penh",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Edit Icon
                  IconButton(
                    onPressed: () {
                      // Add edit profile action
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Profile Options Section
            Expanded(
              child: ListView(
                children: [
                  ProfileOption(
                    icon: Icons.local_offer,
                    color: icon_color,
                    title: "Offers",
                    subtitle: "Coupon and discounts",
                    onTap: () {
                      // Add Offers action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.location_on,
                    color: icon_color,
                    title: "My Address",
                    subtitle: "Manage your address",
                    onTap: () {
                      // Add My Address action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    color: icon_color,
                    title: "Log out",
                    subtitle: "Further secure your account for safety",
                    onTap: () {
                      // Add Log out action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.help_outline,
                    color: icon_color,
                    title: "Help and Support",
                    subtitle: "Get assistance for issues",
                    onTap: () {
                      // Add Help and Support action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.info_outline,
                    color: icon_color,
                    title: "About App",
                    subtitle: "Learn more about the app",
                    onTap: () {
                      // Add About App action
                    },
                  ),
                  ProfileOption(
                    icon: Icons.translate,
                    color: icon_color,
                    title: "Change Language",
                    subtitle: "Switch to your preferred language",
                    onTap: () {
                      // Add Change Language action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
