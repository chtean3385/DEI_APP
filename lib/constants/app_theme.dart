import 'package:dei_champions/models/accessibility/acccessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_extension.dart';
import 'app_colors.dart';


 ThemeData lightTheme(BuildContext context,AccessibilitySettingsModel a) {
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
     brightness: Brightness.light,
     colorScheme: lightColorScheme,
     scaffoldBackgroundColor: Colors.white,
     textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
     appBarTheme: AppBarTheme(
       backgroundColor: Colors.white,
       elevation: 1,
       titleTextStyle: GoogleFonts.inter(
         fontSize: 14 * a.fontScale,
         fontWeight: FontWeight.bold,
         color: Colors.black,
       ),
       iconTheme: IconThemeData(color: Colors.black54),
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
     floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor:a.buttonColor ??  darkColorScheme.primary,
       foregroundColor: Colors.white,
     ),

     useMaterial3: true,

     bottomNavigationBarTheme: BottomNavigationBarThemeData(
       backgroundColor: darkColorScheme.surface,
       selectedItemColor: darkColorScheme.primary,
       unselectedItemColor: Colors.grey.shade400,
     ),
     textTheme:scaledTextTheme,
     extensions: [
       const AppColorExtension(
         black12: Colors.black12,
         black26: Colors.black26,
         black45: Colors.black45,
         black54: Colors.black54,
         black87: Colors.black87,
         blackOpacity10: Color.fromRGBO(0, 0, 0, 0.1),
         blackOpacity30: Color.fromRGBO(0, 0, 0, 0.3),

         white10: Colors.white10,
         white30: Colors.white30,
         white70: Colors.white70,
         white95: Color.fromRGBO(255, 255, 255, 0.95),
         whiteOpacity10: Color.fromRGBO(255, 255, 255, 0.1),
         whiteOpacity30: Color.fromRGBO(255, 255, 255, 0.3),
         whiteOpacity95: Color.fromRGBO(255, 255, 255, 0.95),

         blue: Colors.blue,
         yellow: Colors.yellow,
         grey300: Color(0xFFE0E0E0),
         grey: Colors.grey,
         grey600: Color(0xFF757575),
         grey700: Color(0xFF616161),
         red: Colors.red,
         redAccent: Colors.redAccent,
       )
     ],

   );
 }
ThemeData darkTheme(BuildContext context,AccessibilitySettingsModel a) {
  final isTablet = MediaQuery
      .of(context)
      .size
      .shortestSide >= 600;

  final baseTextTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: isTablet ? 80 : 70,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: GoogleFonts.inter(
      fontSize:isTablet ? 38 :  28,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize:isTablet ? 24 :  20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize:isTablet ? 22 :  18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize:isTablet ? 24 : 20,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize:isTablet ? 32 : 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize:isTablet ? 18 : 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: isTablet ? 18 :16,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: isTablet ? 16 :14,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: isTablet ? 16 :14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),

    labelSmall: GoogleFonts.inter(
      fontSize: isTablet ? 14 :12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: isTablet ? 14 :12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
  final scaledTextTheme = applyFontScale(baseTextTheme, a.fontScale);
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: Colors.black,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 1,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 14 * a.fontScale,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
// ⬇️ APPLY BUTTON COLOR HERE
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: a.buttonColor ?? Colors.black,
        foregroundColor: Colors.black,
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
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:a.buttonColor ??  darkColorScheme.primary,
      foregroundColor: Colors.black,
    ),

    useMaterial3: true,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColorScheme.surface,
      selectedItemColor: darkColorScheme.primary,
      unselectedItemColor: Colors.grey.shade400,
    ),
    textTheme:scaledTextTheme,
      extensions: [
        const AppColorExtension(
          black12: Colors.white12,
          black26: Colors.white24,
          black45: Colors.white38,
          black54: Colors.white60,
          black87: Colors.white70,
          blackOpacity10: Color.fromRGBO(255, 255, 255, 0.1),
          blackOpacity30: Color.fromRGBO(255, 255, 255, 0.3),

          white10: Colors.black12,
          white30: Colors.black26,
          white70: Colors.black45,
          white95: Color.fromRGBO(0, 0, 0, 0.95),
          whiteOpacity10: Color.fromRGBO(0, 0, 0, 0.1),
          whiteOpacity30: Color.fromRGBO(0, 0, 0, 0.3),
          whiteOpacity95: Color.fromRGBO(0, 0, 0, 0.95),

          blue: Colors.lightBlueAccent,
          yellow: Colors.amber,
          grey300: Colors.grey,
          grey: Colors.grey,
          grey600: Color(0xFF9E9E9E),
          grey700: Color(0xFFBDBDBD),
          red: Colors.redAccent,
          redAccent: Colors.red,
        )
      ],


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

  // Primary Colors
  primary: AppColors.primaryColor,        // Same base blue
  onPrimary: Colors.white,                // Text/icon on primary

  // Secondary Colors
  secondary: AppColors.primarySemiDarkColor,
  onSecondary: Colors.white,

  // Surfaces
  surface: Colors.grey[900]!,             // Dark surface background
  onSurface: Colors.white,                // Text on surface

  // Backgrounds
  background: Colors.black,               // Full dark background
  onBackground: Colors.white,             // Text on dark background

  // Errors
  error: Colors.red.shade300,             // Softer red for dark mode
  onError: Colors.black,                  // Text/icon on error
);

// final ColorScheme darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: AppColors.primarySemiDarkColor, // slighty deeper blue/purple blend
//   onPrimary: Colors.white,
//   secondary: AppColors.primaryDarkColor,
//   onSecondary: Colors.white,
//   surface: Colors.grey[900]!,
//   onSurface: Colors.white,
//   background: Colors.black,
//   onBackground: Colors.white,
//   error: Colors.red[400]!,
//   onError: Colors.black,
//
// );


TextTheme applyFontScale(TextTheme base, double scale) {
  return base.apply(fontSizeFactor: scale);
}
extension ColorExt on BuildContext {
  AppColorExtension get colors =>
      Theme.of(this).extension<AppColorExtension>()!;
}
