import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Heading styles using Google Fonts
  static TextStyle get heading1 => GoogleFonts.libreBaskerville(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get heading2 => GoogleFonts.libreBaskerville(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get heading3 => GoogleFonts.libreBaskerville(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get heading4 => GoogleFonts.libreBaskerville(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  // Body text styles
  static TextStyle get bodyLarge => GoogleFonts.libreBaskerville(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodyMedium => GoogleFonts.libreBaskerville(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bodySmall => GoogleFonts.libreBaskerville(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Button text styles
  static TextStyle get buttonLarge => GoogleFonts.libreBaskerville(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get buttonMedium => GoogleFonts.libreBaskerville(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get buttonSmall => GoogleFonts.libreBaskerville(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Caption and label styles
  static TextStyle get caption => GoogleFonts.libreBaskerville(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get overline => GoogleFonts.libreBaskerville(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );
}