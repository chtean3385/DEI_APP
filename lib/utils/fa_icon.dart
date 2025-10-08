import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Centralized icon lookup map
final Map<String, IconData> fontAwesomeMap = {
  'FaAssistiveListeningSystems': FontAwesomeIcons.assistiveListeningSystems,
  'FaExclamationTriangle': FontAwesomeIcons.exclamationTriangle,
  'FaBalanceScale': FontAwesomeIcons.balanceScale,
  'FaUserTie': FontAwesomeIcons.userTie,
  'FaClipboardCheck': FontAwesomeIcons.clipboardCheck,
  'FaClock': FontAwesomeIcons.clock,
  'FaGraduationCap': FontAwesomeIcons.graduationCap,
  'FaHeart': FontAwesomeIcons.heart,
  // --- Organizational Benefits of Male Allyship ---
  'FaUsers': FontAwesomeIcons.users,
  'FaUsersCog': FontAwesomeIcons.usersCog,
  'FaChartLine': FontAwesomeIcons.chartLine,
  // 👇 Optional: add fallback or frequently reused icons
  'FaCircle': FontAwesomeIcons.circle,
  'FaHandshake': FontAwesomeIcons.handshake,
  'FaLightbulb': FontAwesomeIcons.lightbulb,
};

IconData getFontAwesomeIcon(String? iconName) {
  return fontAwesomeMap[iconName] ?? Icons.circle;
}
