import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle get primaryTextStyle => GoogleFonts.libreBaskerville();
  static TextStyle get headingTextStyle => GoogleFonts.libreBaskerville(fontWeight: FontWeight.w600);
  static TextStyle get bodyTextStyle => GoogleFonts.libreBaskerville(fontWeight: FontWeight.w400);
  static TextStyle get buttonTextStyle => GoogleFonts.libreBaskerville(fontWeight: FontWeight.w500);
  
 
  static const int light = 300;
  static const int regular = 400;
  static const int medium = 500;
  static const int semiBold = 600;
  static const int bold = 700;
}