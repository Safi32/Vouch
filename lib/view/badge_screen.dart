import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/consent_101.dart';
import 'package:vouch/widgets/custom_button.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    "Badge Guide",
                    style: AppTextStyles.heading4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Subtitle
              Text(
                "Badges help you understand verification, preferences, and connection status at a glance.",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Scrollable content including badge sections and button
              Expanded(
                child: SingleChildScrollView(
                  child: Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBadgeSection(
                        title: "Vouch Tier",
                        description: "Shows member credibility level based on community vouches.",
                      ),
                      
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      
                      _buildBadgeSection(
                        title: "Verification",
                        description: "Displays the identity verification status and authenticity.",
                      ),
                      
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      
                      _buildBadgeSection(
                        title: "Gender",
                        description: "Shows how members identify themselves within the community.",
                      ),
                      
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      
                      _buildBadgeSection(
                        title: "Connection",
                        description: "Highlights how members wish to connect with others.",
                      ),
                      
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                      
                      _buildBadgeSection(
                        title: "Heart",
                        description: "Highlights how members wish to connect with others.",
                      ),
                      
                      const SizedBox(height: 40),
                      
                     
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: CustomButton(
                            onPressed: () => Get.to(() => const Consent101()),
                            icon: "",
                            text: "Next",
                            backgroundColor: AppColors.primary,
                            borderColor: AppColors.primary,
                            textColor: Colors.black,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 30),
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

  Widget _buildBadgeSection({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.buttonMedium.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.grey.shade600,
              height: 1.5,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  void _handleNext(BuildContext context) {
  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Badge guide completed!",
          style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
    
    // Example navigation
    Navigator.of(context).pop();
  }
}
