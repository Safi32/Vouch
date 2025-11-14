import 'package:flutter/material.dart';
import 'package:vouch/widgets/build_plan_card.dart';
import 'package:vouch/constants/app_images.dart';

Widget build3MonthPlans() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        buildPlanCard(
          price: '\$54.99/550 VC',
          iconPath: AppImages.subscriptionIcon01,
          features: [
            'Search Verified Profiles',
            'Must pay separately for reveals',
            'No reviews visible until profile is unlocked',
            'Once unlocked, up to 5 reviews are visible',
            'Verified profiles: view the first 2 profile pictures before reveal, all pictures available after reveal',
          ],
          isPopular: true,
        ),
        SizedBox(height: 24),
        buildPlanCard(
          price: '\$296.99/2,700 VC',
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
          price: '\$539.99/5,400 VC',
          iconPath: AppImages.subscriptionIcon03,
          features: [
            'Search Verified Profiles',
            'Unlimited rewind credits on Bronze-tier profiles',
            'Full review access available across all profile tiers (Bronze, Silver, Gold, except Black Diamond tier)',
            'All profile pictures visible across all profile tiers (Bronze, Silver, Gold)',
          ],
          isPopular: false,
        ),
      ],
    ),
  );
}
