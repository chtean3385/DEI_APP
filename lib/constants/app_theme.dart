import 'package:dei_champions/models/accessibility/acccessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

 ThemeData lightTheme(BuildContext context,AccessibilitySettingsModel a) {
final isTablet = MediaQuery
    .of(context)
    .size
    .shortestSide >= 600;

final baseTextTheme = TextTheme(
  displayLarge: GoogleFonts.inter(
    fontSize:isTablet? 80 : 70,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headlineMedium: GoogleFonts.inter(
    fontSize: isTablet? 24 :20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleLarge: GoogleFonts.inter(
    fontSize: isTablet? 32 :24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleMedium: GoogleFonts.inter(
    fontSize: isTablet? 18 :16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  labelMedium: GoogleFonts.inter(
    fontSize: isTablet? 16 :14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  bodyMedium: GoogleFonts.inter(
    fontSize:isTablet? 16 : 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
  labelSmall: GoogleFonts.inter(
    fontSize:isTablet? 14 : 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
);
final scaledTextTheme = applyFontScale(baseTextTheme, a.fontScale);

return ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    brightness: Brightness.light,
    primary: Colors.black,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 1,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 14 * a.fontScale,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  // ⬇️ APPLY BUTTON COLOR HERE
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: a.buttonColor ?? Colors.black,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14 * a.fontScale,
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: a.buttonColor ?? Colors.black,
      side: BorderSide(color: a.buttonColor ?? Colors.black, width: 1.5),
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14 * a.fontScale,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: a.buttonColor ?? Colors.black,
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14 * a.fontScale,
      ),
    ),
  ),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(
    backgroundColor: a.buttonColor ?? Colors.white,
    foregroundColor: Colors.white,
  ),
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme:scaledTextTheme,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
);}
ThemeData darkTheme(BuildContext context,AccessibilitySettingsModel a) {
  final isTablet = MediaQuery
      .of(context)
      .size
      .shortestSide >= 600;

  final baseTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: isTablet ? 80 : 70,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize:isTablet ? 38 :  28,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize:isTablet ? 24 :  20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize:isTablet ? 22 :  18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize:isTablet ? 24 : 20,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize:isTablet ? 32 : 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize:isTablet ? 18 : 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: isTablet ? 18 :16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: isTablet ? 16 :14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: isTablet ? 16 :14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),

    labelSmall: GoogleFonts.inter(
      fontSize: isTablet ? 14 :12,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: isTablet ? 14 :12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );
  final scaledTextTheme = applyFontScale(baseTextTheme, a.fontScale);
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black54),
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
      displayLarge: GoogleFonts.inter(
        fontSize: isTablet ? 80 : 70,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize:isTablet ? 38 :  28,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize:isTablet ? 24 :  20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize:isTablet ? 22 :  18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize:isTablet ? 24 : 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize:isTablet ? 32 : 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize:isTablet ? 18 : 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: isTablet ? 18 :16,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: isTablet ? 16 :14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: isTablet ? 16 :14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),

      labelSmall: GoogleFonts.inter(
        fontSize: isTablet ? 14 :12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: GoogleFonts.inter(
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


TextTheme applyFontScale(TextTheme base, double scale) {
  return base.apply(fontSizeFactor: scale);
}
