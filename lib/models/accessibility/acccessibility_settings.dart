import 'package:flutter/material.dart';



class AccessibilitySettingsModel {
  final double fontScale;
  final Color buttonColor;
  final bool isDarkMode;

  const AccessibilitySettingsModel({
    this.fontScale = 1.0,
    this.buttonColor = Colors.blue,
    this.isDarkMode = false,
  });

  AccessibilitySettingsModel copyWith({
    double? fontScale,
    Color? buttonColor,
  }) {
    return AccessibilitySettingsModel(
      fontScale: fontScale ?? this.fontScale,
      buttonColor: buttonColor ?? this.buttonColor,
    );
  }
}
