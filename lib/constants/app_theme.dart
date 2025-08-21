import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

 ThemeData lightTheme(BuildContext context) {
final isTablet = MediaQuery
    .of(context)
    .size
    .shortestSide >= 600;

return ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.light,
    primary: Colors.black,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    elevation: 1,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
  ),
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize:isTablet? 80 : 70,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: isTablet? 24 :20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: isTablet? 32 :24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: isTablet? 18 :16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: isTablet? 16 :14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize:isTablet? 16 : 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize:isTablet? 14 : 12,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
);}
ThemeData darkTheme(BuildContext context) {
  final isTablet = MediaQuery
      .of(context)
      .size
      .shortestSide >= 600;

  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.primary,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: Colors.white,
    ),

    useMaterial3: true,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: Colors.grey.shade400,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: isTablet ? 80 : 70,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize:isTablet ? 24 :  20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize:isTablet ? 24 : 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize:isTablet ? 32 : 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize:isTablet ? 18 : 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: isTablet ? 18 :16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: isTablet ? 16 :14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: isTablet ? 16 :14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),

      labelSmall: GoogleFonts.poppins(
        fontSize: isTablet ? 14 :12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: isTablet ? 14 :12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  );
}



// 🌞 Light Theme ColorScheme
final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: Colors.white,
  secondary: AppColors.primarySemiDarkColor,
  onSecondary: Colors.white,
  surface: Colors.grey[100]!,
  onSurface: Colors.black,
  background: Colors.white,
  onBackground: Colors.black,
  error: Colors.red,
  onError: Colors.white,
);

// 🌚 Dark Theme ColorScheme
final ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primarySemiDarkColor, // slighty deeper blue/purple blend
  onPrimary: Colors.white,
  secondary: AppColors.primaryDarkColor,
  onSecondary: Colors.white,
  surface: Colors.grey[900]!,
  onSurface: Colors.white,
  background: Colors.black,
  onBackground: Colors.white,
  error: Colors.red[400]!,
  onError: Colors.black,
);


