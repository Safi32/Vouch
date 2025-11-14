import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
     this.icon,
    required this.text,
    required this.backgroundColor,
    required this.borderColor, required this.textColor,
  });

  final VoidCallback? onPressed;
  final String? icon;
  final String text;
  final Color backgroundColor;
  final Color? borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        side: borderColor != null ? BorderSide(color: borderColor!, width: 2.0) : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && icon!.isNotEmpty) ...[
            Image.asset(icon!, width: 20, height: 20),
            SizedBox(width: 10),
          ],
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
