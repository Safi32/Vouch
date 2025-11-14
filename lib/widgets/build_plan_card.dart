import 'package:flutter/material.dart';
import 'package:vouch/theme/app_text_styles.dart';
import 'package:vouch/utils/colors.dart';
 

Widget buildPlanCard({
  required String price,
  required List<String> features,
  required bool isPopular,
  String? iconPath,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isPopular ? AppColors.primary : Colors.grey.shade200,
        width: isPopular ? 2 : 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade100,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        if (isPopular)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              'Most Popular',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon and Price Row
              Row(
                children: [
                  // Subscription Icon
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                    
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: iconPath != null
                        ? Image.asset(
                            iconPath,
                            width: 24,
                            height: 24,
                         
                          )
                        : Icon(
                            Icons.verified,
                            color: Colors.white,
                            size: 24,
                          ),
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
 
              ...features
                  .map(
                    (feature) => Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check, color: Colors.green, size: 16),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: Colors.grey.shade700,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),

              SizedBox(height: 20),

 
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                
                    print('Subscribe to: $price');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Subscribe Now',
                    style: AppTextStyles.buttonMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
