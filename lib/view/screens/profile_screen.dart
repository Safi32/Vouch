import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/auth/change_password_screen.dart';
import 'package:vouch/view/screens/my_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkModeEnabled = false;
  bool isShowFirstNameEnabled = false;
  bool isPushNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.grey[200],
                        width: 70,
                        height: 70,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => MyProfileScreen());
                            },
                            child: Image.asset(
                              AppImages.profilePicture,
                              width: 65,
                              height: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'johndoe@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '+1 123 456 7890',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'App Preferences',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Dark Mode', style: TextStyle(fontSize: 16)),
                    Switch(
                      value: isDarkModeEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          isDarkModeEnabled = value;
                        });
                      },
                      activeTrackColor: AppColors.primary,
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Show only first name',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: isShowFirstNameEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          isShowFirstNameEnabled = value;
                        });
                      },
                      activeTrackColor: AppColors.primary,
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Push Notifications',
                      style: TextStyle(fontSize: 16),
                    ),
                    Switch(
                      value: isPushNotificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          isPushNotificationsEnabled = value;
                        });
                      },
                      activeTrackColor: AppColors.primary,
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: const Text(
                    'Fast Track Priority',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: const Icon(Icons.arrow_forward, size: 18),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Language', style: TextStyle(fontSize: 16)),
                  trailing: const Icon(Icons.arrow_forward, size: 18),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                const Text(
                  'Account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      Get.to(() => ChangePasswordScreen());
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text(
                    'Manage Subscription',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text(
                    'Change Preferences',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text('Badge Guide', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text('Wallet', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text('Referral', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Legal',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const ListTile(
                  title: Text(
                    'Terms & Privacy',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                const ListTile(
                  title: Text('Help & Safety', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward, size: 18),
                ),
                ListTile(
                  title: const Text('Logout', style: TextStyle(fontSize: 16)),
                  trailing: const Icon(Icons.arrow_forward, size: 18),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
