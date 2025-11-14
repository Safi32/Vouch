import 'package:flutter/material.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/theme/app_text_styles.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  final T value;
  final T? groupValue;
  final Function(T?) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey[400]!,
                width: 2,
              ),
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}