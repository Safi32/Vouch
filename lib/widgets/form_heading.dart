import 'package:flutter/material.dart';
import 'package:vouch/theme/app_text_styles.dart';

class FormHeading extends StatelessWidget {
  const FormHeading({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w900,
  });

  final String text;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.bodyMedium.copyWith(
        fontWeight: fontWeight,
        color: Colors.black,
      ),
    );
  }
}