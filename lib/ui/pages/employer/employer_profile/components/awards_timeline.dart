// // ---------------------------- Awards timeline ----------------------------
// import 'package:dei_champions/constants/app_colors.dart';
// import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../widgets/others/view_all_button.dart';
//
// class AwardsTimeline extends StatelessWidget {
//   const AwardsTimeline({Key? key}) : super(key: key);
//
//   final List<Map<String, String>> _awards = const [
//     {'year': '2025', 'text': 'Great Place to Work®'},
//     {'year': '2024', 'text': 'Cognizant ranked 3rd in LinkedIn Top Companies'},
//     {'year': '2024', 'text': "World's Best Employers, Forbes"},
//     {'year': '2021', 'text': 'Best Achievement in a Process Mining Program'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return CustomDecoratedBox(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Awards & Recognitions', style: theme.titleMedium),
//               ViewAllButton(isSmall: true),
//             ],
//           ),
//           const SizedBox(height: 8),
//           SizedBox(
//             height: _awards.length * 72.0,
//             // simple timeline: a column with leading dots and lines
//             child: ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _awards.length,
//               separatorBuilder: (_, __) => const SizedBox(height: 8),
//               itemBuilder: (context, index) {
//                 final item = _awards[index];
//                 final isLast = index == _awards.length - 1;
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           width: 14,
//                           height: 14,
//                           decoration: BoxDecoration(
//                             color: Colors.blue.shade50,
//                             border: Border.all(
//                               color: AppColors.primaryColor,
//                               width: 2,
//                             ),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         if (!isLast)
//                           Container(
//                             width: 2,
//                             height: 56,
//                             color: Colors.grey.shade300,
//                           ),
//                       ],
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(item['year']!, style: theme.bodyMedium),
//                           const SizedBox(height: 6),
//                           Text(
//                             item['text']!,
//                             style: theme.bodyMedium?.copyWith(
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
