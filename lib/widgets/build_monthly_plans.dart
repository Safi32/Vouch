import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:vouch/view/verify_your_identity.dart';
import 'package:vouch/widgets/build_plan_card.dart';
import 'package:vouch/constants/app_images.dart';

Widget buildMonthlyPlans() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(() => const VerifyYourIdentity());
          },
          child: buildPlanCard(
            price: '\$19.99/200 VC',
            iconPath: AppImages.subscriptionIcon01,
            features: [
              'Search Verified Profiles',
              'Must pay separately for reveals',
              'No reviews visible until profile is unlocked',
              'Once unlocked, up to 5 reviews are visible',
              'Verified profiles: view the first 2 profile pictures before reveal, all pictures available after reveal',
            ],
            isPopular: false,
          ),
        ),
        SizedBox(height: 24),
        buildPlanCard(
          price: '\$99.99/1,000 VC',
          iconPath: AppImages.subscriptionIcon02,
          features: [
            'Search Verified Profiles',
            'Includes 20 rewind credits (credits only apply to Bronze-tier profiles)',
            'Ability to preview 5 reviews before reveal; after reveal, an additional 5 reviews become available',
            'Review access feature also applies to higher-tier profiles',
            'Ability to view up to 5 profile pictures before reveal (only for Bronze and Silver tier models)',
          ],
          isPopular: false,
        ),
        SizedBox(height: 24),
        buildPlanCard(
          price: '\$199.99/2,000 VC',
          iconPath: AppImages.subscriptionIcon03,
          features: [
            'Search Verified Profiles',
            'Unlimited rewind credits on Bronze-tier profiles',
            'Full rewind access available across all profile tiers (Bronze, Silver, Gold, except Black Diamond tier)',
            'All profile pictures visible across all profile tiers (Bronze, Silver, Gold)',
          ],
          isPopular: false,
        ),
      ],
    ),
  );
}
