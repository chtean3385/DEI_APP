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
  // --- JSON Data Icons ---
  'FaRegLightbulb': FontAwesomeIcons.solidLightbulb,
  'FaUserFriends': FontAwesomeIcons.userFriends,
  'FaRegStar': FontAwesomeIcons.solidStar,
  'FaShieldAlt': FontAwesomeIcons.shieldAlt,
  // 👇 Optional: add fallback or frequently reused icons
  'FaCircle': FontAwesomeIcons.circle,
  'FaHandshake': FontAwesomeIcons.handshake,
  'FaLightbulb': FontAwesomeIcons.lightbulb,
  // --- Gen Z JSON Data Icons ---
  'FaCarAlt': FontAwesomeIcons.carAlt,
  'FaGlobe': FontAwesomeIcons.globe,
  'FaTree': FontAwesomeIcons.tree,
  'FaSyncAlt': FontAwesomeIcons.syncAlt,
  'FaTransgender': FontAwesomeIcons.transgender,
  'FaRocketchat': FontAwesomeIcons.rocketchat,
  'FaRegHeart': FontAwesomeIcons.solidHeart,
  'FaRocket': FontAwesomeIcons.rocket,
  'FaFileDownload': FontAwesomeIcons.fileDownload,
  // --- Veteran JSON Data Icons ---
  'FaSearch': FontAwesomeIcons.search,
  'FaRecordVinyl': FontAwesomeIcons.recordVinyl,
  'FaMedal': FontAwesomeIcons.medal,
  'FaRegCompass': FontAwesomeIcons.compass, // Regular compass
  'FaTools': FontAwesomeIcons.tools,
  'FaBolt': FontAwesomeIcons.bolt,
  'FaSitemap': FontAwesomeIcons.sitemap,
  'FaRegCheckCircle': FontAwesomeIcons.solidCheckCircle,
  'FaCheckSquare': FontAwesomeIcons.solidSquareCheck,
  'FaExchangeAlt': FontAwesomeIcons.exchangeAlt,
  // --- LQBTQ JSON Data Icons ---
  'FaRainbow': FontAwesomeIcons.rainbow,
  'FaFileAlt': FontAwesomeIcons.fileAlt,
  'FaBuilding': FontAwesomeIcons.building,
  'FaGolfBall': FontAwesomeIcons.golfBall,

};

IconData getFontAwesomeIcon(String? iconName) {
  return fontAwesomeMap[iconName] ?? Icons.circle;
}
