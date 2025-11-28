import 'package:flutter/material.dart';

class MyTextStyle {
  static TextStyle appBarTitle = const TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 20, // Size in pixels
    fontWeight: FontWeight.w600, // Bold
    height: 25 / 20,
    letterSpacing: 0.38,
    color: Color(0xFF1E293B),
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle sectionTitle3 = TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 15, // Size in pixels
    fontWeight: FontWeight.w600, // Bold
    height: 20 / 15, // Line height ratio
    letterSpacing: -0.5, // Letter spacing

    color: Color(0xFF1E293B), // Hex color for --Heading-Text
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle sectionSubTitle1 = TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 13, // Size in pixels
    fontWeight: FontWeight.w400, // Bold
    height: 18 / 13, // Line height ratio
    letterSpacing: -0.078, // Letter spacing
    color: Color(
        0xFF1E293B), //MyColor.getHeaderTextColor(), // Hex color for --Heading-Text
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle caption1Style = TextStyle(
    fontFamily: 'AlbertSans', // Ensure the font is added in pubspec.yaml
    fontSize: 12, // Use a responsive size utility
    fontWeight: FontWeight.w400, // Regular weight
    height: 16 / 12, // Line height ratio based on your CSS
    letterSpacing: 0, // Default letter spacing; adjust if needed
    color: Color(0xFF1E293B), // Custom color utility
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle caption2Style = TextStyle(
    fontFamily: 'AlbertSans', // Ensure the font is added in pubspec.yaml
    fontSize: 11, // Use a responsive size utility
    fontWeight: FontWeight.w400, // Regular weight
    height: 13 / 11, // Line height ratio based on your CSS
    letterSpacing: 0.06, // Default letter spacing; adjust if needed
    color: Color(0xFF1E293B), // Custom color utility
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle bodyTextStyle1 = TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 16, // Size in pixels
    fontWeight: FontWeight.w400, // Bold
    height: 21 / 16, // Line height ratio
    letterSpacing: -0.32, // Letter spacing
    color: Color(0XFFFFFFFF), // Hex color for --Heading-Text
    fontFamilyFallback: ['sans-serif'],
  );

  static TextStyle buttonTextStyle1 = TextStyle(
    fontFamily: 'AlbertSans',
    fontSize: 16, // Matches the 16px font size
    fontWeight: FontWeight.w500, // Medium (font-weight: 500)
    height: 19.2 / 16, // Line height ratio (19.2px / 16px = 120%)
    letterSpacing: 0, // No letter spacing specified in CSS
    color: Colors.white, // Hex color for --Heading-Text
    fontFamilyFallback: ['sans-serif'],
  );
}
