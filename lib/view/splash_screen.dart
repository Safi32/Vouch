import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/view/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  void _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 3)); 
    Get.to(() => const WelcomeScreen()); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
