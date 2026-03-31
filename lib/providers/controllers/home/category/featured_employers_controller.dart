// import 'dart:async';
// import 'package:dei_champions/constants/enums.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../constants/app_drawables.dart';
// import '../../../../models/home/featured_employer/employer_model.dart';
// import '../../../../models/state_models/home/featured_employers_state.dart';
// import '../../../../widgets/others/snack_bar.dart';
//
//
//
// class FeaturedEmployersController extends StateNotifier<FeaturedEmployersState> {
//   FeaturedEmployersController() : super(FeaturedEmployersState.initial()) {
//     fetchFeaturedEmployers();
//   }
//
//   Future<void> fetchFeaturedEmployers() async {
//     state = state.copyWith(pageState: PageState.loading);
//
//     try {
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 2));
//
//       // Full real employers list
//       final List<Map<String, dynamic>> employersJson = [
//         {
//           "logo": AppDrawables.brand1,
//           "badge": "🏅 Gold DEI Certified",
//           "badgeClass": "gold",
//           "title": "InclusionTech",
//           "tags": ["🌈 LGBTQ+ ERG", "🔠 Braille Tools", "👩‍🏫 Women Mentorship"],
//         },
//         {
//           "logo": AppDrawables.brand2,
//           "badge": "🥈 Silver DEI Certified",
//           "badgeClass": "silver",
//           "title": "CarePlus Healthcare",
//           "tags": ["🏡 Remote First", "🚻 Accessible Restrooms", "👩‍👧‍👦 Returnships"],
//         },
//         {
//           "logo":AppDrawables.brand3,
//           "badge": "🥉 Bronze DEI Certified",
//           "badgeClass": "bronze",
//           "title": "EquiWork Solutions",
//           "tags": ["🧠 Neurodiverse Hiring", "🤟 Sign Language", "🎖️ Veteran-Friendly"],
//         },
//         {
//           "logo":AppDrawables.brand4,
//           "badge": "🥉 Gold DEI Certified",
//           "badgeClass": "gold",
//           "title": "EquiWork Solutions",
//           "tags": ["🧠 Neurodiverse Hiring", "🤟 Sign Language", "🎖️ Veteran-Friendly"],
//         },
//         {
//           "logo": AppDrawables.brand5,
//           "badge": "🥉 Gold DEI Certified",
//           "badgeClass": "gold",
//           "title": "EquiWork Solutions",
//           "tags": ["🧠 Neurodiverse Hiring", "🤟 Sign Language", "🎖️ Veteran-Friendly"],
//         },
//       ];
//
//       final employers =
//       employersJson.map((e) => Employer.fromJson(e)).toList();
//
//       state = state.copyWith(
//         pageState: PageState.success,
//         data: employers,
//       );
//     } catch (e) {
//       state = state.copyWith(
//         pageState: PageState.error,
//         errorMessage: e.toString(),
//       );
//       debugPrint(" catch fetchFeaturedEmployers -${e.toString()}");
//       showSnackBar(e.toString());
//     }
//   }
// }
