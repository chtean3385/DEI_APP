// 🌞 Light Theme ColorScheme
import 'package:flutter/material.dart';

import 'app_colors.dart';

final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: Colors.white,
  secondary: Colors.white,
  onSecondary: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  background: Colors.white,
  onBackground: Colors.black,
  error: Colors.red,
  onError: Colors.white,
  onSurfaceVariant: Colors.grey,
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
  onSurface: Colors.white,
  onSurfaceVariant: Colors.grey.shade400,

  // Backgrounds
  background: Colors.black,               // Full dark background
  onBackground: Colors.white,             // Text on dark background

  // Errors
  error: Colors.red.shade300,             // Softer red for dark mode
  onError: Colors.black,
  // Text/icon on error
);