import 'package:flutter/material.dart';
import 'package:vouch/theme/app_text_styles.dart';

class InfoBanner extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;

  const InfoBanner({
    super.key,
    required this.icon,
    required this.message,
    this.backgroundColor = const Color(0xFFFFF3E0),
    this.iconColor = const Color(0xFFFF9800),
    this.textColor = const Color(0xFFE65100),
  });

  factory InfoBanner.warning({
    required String message,
  }) {
    return InfoBanner(
      icon: Icons.info_outline,
      message: message,
      backgroundColor: const Color(0xFFFFF3E0),
      iconColor: const Color(0xFFFF9800),
      textColor: const Color(0xFFE65100),
    );
  }

  factory InfoBanner.success({
    required String message,
  }) {
    return InfoBanner(
      icon: Icons.check_circle_outline,
      message: message,
      backgroundColor: const Color(0xFFE8F5E8),
      iconColor: Colors.green,
      textColor: const Color(0xFF2E7D32),
    );
  }

  factory InfoBanner.info({
    required String message,
  }) {
    return InfoBanner(
      icon: Icons.info_outline,
      message: message,
      backgroundColor: const Color(0xFFE3F2FD),
      iconColor: Colors.blue,
      textColor: const Color(0xFF1565C0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: iconColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.bodySmall.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}