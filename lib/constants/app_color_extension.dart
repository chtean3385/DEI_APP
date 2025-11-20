import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  // ─────────────────────────────
  // Black Variants
  // ─────────────────────────────
  final Color black12;
  final Color black26;
  final Color black45;
  final Color black54;
  final Color black87;
  final Color blackOpacity10;
  final Color blackOpacity30;

  // ─────────────────────────────
  // White Variants
  // ─────────────────────────────
  final Color white10;
  final Color white30;
  final Color white70;
  final Color white95;
  final Color whiteOpacity10;
  final Color whiteOpacity30;
  final Color whiteOpacity95;

  // ─────────────────────────────
  // Basic Colors
  // ─────────────────────────────
  final Color blue;
  final Color yellow;
  final Color grey300;
  final Color grey;
  final Color grey600;
  final Color grey700;
  final Color red;
  final Color redAccent;

  const AppColorExtension({
    required this.black12,
    required this.black26,
    required this.black45,
    required this.black54,
    required this.black87,
    required this.blackOpacity10,
    required this.blackOpacity30,
    required this.white10,
    required this.white30,
    required this.white70,
    required this.white95,
    required this.whiteOpacity10,
    required this.whiteOpacity30,
    required this.whiteOpacity95,
    required this.blue,
    required this.yellow,
    required this.grey300,
    required this.grey,
    required this.grey600,
    required this.grey700,
    required this.red,
    required this.redAccent,
  });

  @override
  AppColorExtension copyWith({
    Color? black12,
    Color? black26,
    Color? black45,
    Color? black54,
    Color? black87,
    Color? blackOpacity10,
    Color? blackOpacity30,
    Color? white10,
    Color? white30,
    Color? white70,
    Color? white95,
    Color? whiteOpacity10,
    Color? whiteOpacity30,
    Color? whiteOpacity95,
    Color? blue,
    Color? yellow,
    Color? grey300,
    Color? grey,
    Color? grey600,
    Color? grey700,
    Color? red,
    Color? redAccent,
  }) {
    return AppColorExtension(
      black12: black12 ?? this.black12,
      black26: black26 ?? this.black26,
      black45: black45 ?? this.black45,
      black54: black54 ?? this.black54,
      black87: black87 ?? this.black87,
      blackOpacity10: blackOpacity10 ?? this.blackOpacity10,
      blackOpacity30: blackOpacity30 ?? this.blackOpacity30,
      white10: white10 ?? this.white10,
      white30: white30 ?? this.white30,
      white70: white70 ?? this.white70,
      white95: white95 ?? this.white95,
      whiteOpacity10: whiteOpacity10 ?? this.whiteOpacity10,
      whiteOpacity30: whiteOpacity30 ?? this.whiteOpacity30,
      whiteOpacity95: whiteOpacity95 ?? this.whiteOpacity95,
      blue: blue ?? this.blue,
      yellow: yellow ?? this.yellow,
      grey300: grey300 ?? this.grey300,
      grey: grey ?? this.grey,
      grey600: grey600 ?? this.grey600,
      grey700: grey700 ?? this.grey700,
      red: red ?? this.red,
      redAccent: redAccent ?? this.redAccent,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;

    return AppColorExtension(
      black12: Color.lerp(black12, other.black12, t)!,
      black26: Color.lerp(black26, other.black26, t)!,
      black45: Color.lerp(black45, other.black45, t)!,
      black54: Color.lerp(black54, other.black54, t)!,
      black87: Color.lerp(black87, other.black87, t)!,
      blackOpacity10: Color.lerp(blackOpacity10, other.blackOpacity10, t)!,
      blackOpacity30: Color.lerp(blackOpacity30, other.blackOpacity30, t)!,
      white10: Color.lerp(white10, other.white10, t)!,
      white30: Color.lerp(white30, other.white30, t)!,
      white70: Color.lerp(white70, other.white70, t)!,
      white95: Color.lerp(white95, other.white95, t)!,
      whiteOpacity10: Color.lerp(whiteOpacity10, other.whiteOpacity10, t)!,
      whiteOpacity30: Color.lerp(whiteOpacity30, other.whiteOpacity30, t)!,
      whiteOpacity95: Color.lerp(whiteOpacity95, other.whiteOpacity95, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      grey600: Color.lerp(grey600, other.grey600, t)!,
      grey700: Color.lerp(grey700, other.grey700, t)!,
      red: Color.lerp(red, other.red, t)!,
      redAccent: Color.lerp(redAccent, other.redAccent, t)!,
    );
  }
}
