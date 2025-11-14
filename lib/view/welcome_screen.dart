import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/choose_your_language_screen.dart';
import 'package:vouch/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(AppImages.logo, width: 100, height: 100),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "The Trusted Way to Date",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Connect with verified profiles and \nexceptional individuals.",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Colors.grey.shade300,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        icon: AppImages.peopleIcon,
                        text: "Join as Member",
                        backgroundColor: AppColors.primary,
                        borderColor: AppColors.primary,
                        onPressed: () {
                          Get.to(()=> const ChooseYourLanguageScreen());
                        },
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        icon: AppImages.starIcon,
                        text: "Join as Profile",
                        backgroundColor: Colors.white,
                        borderColor: AppColors.primary,
                        onPressed: () {},
                        textColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
