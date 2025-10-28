// import 'package:flutter/material.dart';
//
// import '../../../../constants/app_styles.dart';
// import '../../../../widgets/others/rounded_network_image.dart';
//
// class SearchJobCard extends StatelessWidget {
//   const SearchJobCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).textTheme;
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16),
//           topRight: Radius.circular(6),
//           bottomLeft: Radius.circular(6),
//           bottomRight: Radius.circular(16),
//         ),
//         side: BorderSide(color: Colors.black12, width: 1),
//       ),
//       elevation: 0,
//       color: Colors.white,
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Flutter Developer",
//                         style: theme.labelMedium,
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         "Infosys ",
//                         style: theme.displaySmall?.copyWith(
//                           color: Colors.black54,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                     ],
//                   ),
//                 ),
//                 gapW8(),
//                 RoundedNetworkImage(
//                   imageUrl: "",
//                   width: 50,
//                   height: 50,
//                   borderRadius: 8,
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Icon(
//                   Icons.location_on_outlined,
//                   size: 16,
//                   color: Colors.black54,
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   "Coimbatore",
//                   style: theme.displaySmall?.copyWith(
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Row(
//               children: [
//                 Icon(
//                   Icons.work_history_outlined,
//                   size: 16,
//                   color: Colors.black54,
//                 ),
//                 SizedBox(width: 4),
//                 Text(
//                   "1-3 yrs",
//                   style: theme.displaySmall?.copyWith(
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Row(
//               children: [
//                 SizedBox(width: 5),
//                 Text(
//                   "₹",
//                   style: theme.labelMedium?.copyWith(
//                     color: Colors.black54,
//                   ),
//                 ),
//                 SizedBox(width: 6),
//                 Text(
//                   "2-3 lacs PA",
//                   style: theme.displaySmall?.copyWith(
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Text(
//               "Flutter, Dart, Provider, Firebase",
//               overflow: TextOverflow.ellipsis,
//               softWrap: true,
//               style: theme.displaySmall?.copyWith(
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 6),
//
//             Row(
//               children: [
//                 Expanded(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color:  Colors.red.shade50,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Text(
//                           "3 vacancies",
//                           style: theme.displaySmall?.copyWith(
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                       gapW16(),
//                       Text(
//                         "28d ago",
//                         overflow: TextOverflow.ellipsis,
//                         softWrap: true,
//                         style: theme.displaySmall?.copyWith(
//                           color: Colors.black54,
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.bookmark_border_outlined,
//                       size: 20,
//                       color: Colors.black54,
//                     ),
//                     SizedBox(width: 4),
//                     Text(
//                       "save",
//                       style: theme.labelSmall?.copyWith(
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
