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
  'FaCheckCircle': FontAwesomeIcons.checkCircle,
  //  ExploreServiceProgramModel JSON
  'FaUserPlus': FontAwesomeIcons.userPlus,
  'FaBriefcase': FontAwesomeIcons.briefcase,
  'FaFunnelDollar': FontAwesomeIcons.funnelDollar,
  'FaAccessibleIcon': FontAwesomeIcons.accessibleIcon,
  'FaStar': FontAwesomeIcons.star,
  'FaBell': FontAwesomeIcons.bell,
  'FaHandsHelping': FontAwesomeIcons.handsHelping,
  //  Dei Corporate Championing JSON
  'FaClipboardList': FontAwesomeIcons.clipboardList,
  'FaChessQueen': FontAwesomeIcons.chessQueen,
  'FaBullhorn': FontAwesomeIcons.bullhorn,
  'FaChartPie': FontAwesomeIcons.chartPie,
  'FaUserMinus': FontAwesomeIcons.userMinus,
  'FaHandHoldingHeart': FontAwesomeIcons.handHoldingHeart,

  // --- Dashboard Icons ---
  'FaDashboardClipboardList': FontAwesomeIcons.clipboardList,
  'FaDashboardClock': FontAwesomeIcons.clock,
  'FaDashboardCheckCircle': FontAwesomeIcons.checkCircle,
  'FaDashboardComments': FontAwesomeIcons.comments,
  'FaDashboardHandshake': FontAwesomeIcons.handshake,
  'FaDashboardUserTie': FontAwesomeIcons.userTie,
  'FaDashboardTimesCircle': FontAwesomeIcons.timesCircle,
  'FaDashboardBookmark': FontAwesomeIcons.bookmark,

  // Notifications
  'briefcase': FontAwesomeIcons.briefcase,
  'calendar': FontAwesomeIcons.calendar,
  'envelope': FontAwesomeIcons.envelope,
  'fileAlt': FontAwesomeIcons.fileAlt,
  'comment': FontAwesomeIcons.comment,
  'bell': FontAwesomeIcons.bell,
  'check': FontAwesomeIcons.check,
  'user': FontAwesomeIcons.user,


  'FaSchool': FontAwesomeIcons.school,
  'FaLeaf': FontAwesomeIcons.leaf,
};
IconData getFontAwesomeIcon(String? iconName) {
  return fontAwesomeMap[iconName] ?? Icons.circle;
}
/// Maps API "key" values to specific FontAwesome icons for dashboard items.
final Map<String, IconData> dashboardIconMap = {
  'allApplications': FontAwesomeIcons.clipboardList,
  'savedJobs': FontAwesomeIcons.bookmark,
  'pending': FontAwesomeIcons.clock,
  'accepted': FontAwesomeIcons.checkCircle,
  'interviewing': FontAwesomeIcons.comments,
  'negotiation': FontAwesomeIcons.handshake,
  'hired': FontAwesomeIcons.userTie,
  'rejected': FontAwesomeIcons.timesCircle,
  //employer
  'totalJobs': FontAwesomeIcons.clipboardList,
  'openJobs': FontAwesomeIcons.solidCircleCheck,
  'closedJobs': FontAwesomeIcons.solidCircleXmark,
  'draftJobs': FontAwesomeIcons.solidCircleXmark,
  'totalApplicants': FontAwesomeIcons.userTie,
};
IconData getDashboardIcon(String? key) {
  return dashboardIconMap[key] ?? Icons.circle;
}

