import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getFontAwesomeIcon(String? iconName) {
  switch (iconName) {
    case 'FaClipboardCheck':
      return FontAwesomeIcons.clipboardCheck;
    case 'FaClock':
      return FontAwesomeIcons.clock;
    case 'FaGraduationCap':
      return FontAwesomeIcons.graduationCap;
    case 'FaBalanceScale':
      return FontAwesomeIcons.balanceScale;
    case 'FaHeart':
      return FontAwesomeIcons.heart;
    default:
      return Icons.help_outline; // fallback icon if not matched
  }
}
