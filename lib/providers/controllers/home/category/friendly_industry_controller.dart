import 'dart:async';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/models/state_models/home/friendly_industries_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_drawables.dart';
import '../../../../models/home/friendly_industries/friendly_industry_model.dart';
import '../../../../widgets/others/snack_bar.dart';




class FriendlyIndustryController extends StateNotifier<FriendlyIndustryState> {
  FriendlyIndustryController() : super(FriendlyIndustryState.initial()) {
    fetchFriendlyIndustries();
  }

  Future<void> fetchFriendlyIndustries() async {
    state = state.copyWith(pageState: PageState.loading);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Dummy industries list
      final List<Map<String, dynamic>> industriesJson = [
        {
          "name": "Information Technology",
          "icon": AppDrawables.friendly1,
          "alt": "Information Technology",
          "badge": {"text": "🌐 Remote Roles", "color": "primary"},
          "description": "LGBTQ+ Inclusive, Neurodiverse Hiring",
          "location": "PAN India & US",
          "jobs": "220+ Open Jobs"
        },
        {
          "name": "Accounting & Finance",
          "icon": AppDrawables.friendly2,
          "alt": "Finance",
          "badge": {"text": "💼 Women-Led", "color": "success"},
          "description": "DEI Policies, Returnships, Global Teams",
          "location": "Delhi NCR, Mumbai",
          "jobs": "145+ Open Jobs"
        },
        {
          "name": "Healthcare & Life Sciences",
          "icon": AppDrawables.friendly3,
          "alt": "Healthcare",
          "badge": {"text": "❤️ Inclusive", "color": "danger"},
          "description": "PWD Accessibility, Gender-Neutral Hiring",
          "location": "Bengaluru, Pune",
          "jobs": "180+ Open Jobs"
        },
        {
          "name": "Education & EdTech",
          "icon": AppDrawables.friendly4,
          "alt": "Education",
          "badge": {"text": "📚 Women Re-entry", "color": "info"},
          "description": "Mentorship, Training, Inclusive Hiring",
          "location": "Remote & Hybrid",
          "jobs": "95+ Open Jobs"
        },
        {
          "name": "Manufacturing",
          "icon": AppDrawables.friendly5,
          "alt": "Manufacturing",
          "badge": {"text": "🏭 Veteran Support", "color": "secondary"},
          "description": "Veteran-Focused Roles, Inclusive Factories",
          "location": "Gujarat, Tamil Nadu",
          "jobs": "110+ Open Jobs"
        },
        {
          "name": "Human Resources",
          "icon": AppDrawables.friendly6,
          "alt": "Human Resources",
          "badge": {"text": "🧍🏽‍♀️ DEI Policy Drivers", "color": "warning"},
          "description": "Employee Advocacy, Gender Parity",
          "location": "Mumbai, Hyderabad",
          "jobs": "60+ Open Jobs"
        },
        {
          "name": "Logistics & Transport",
          "icon": AppDrawables.friendly7,
          "alt": "Logistics",
          "badge": {"text": "🚚 PWD Hiring", "color": "dark"},
          "description": "Accessible Work, Non-Discriminatory Roles",
          "location": "Across India",
          "jobs": "80+ Open Jobs"
        },
        {
          "name": "Media & Entertainment",
          "icon": AppDrawables.friendly8,
          "alt": "Media",
          "badge": {"text": "🎥 LGBTQIA+ Safe", "color": "pink"},
          "description": "Creative Inclusion & Gender-Neutral Roles",
          "location": "Delhi, Mumbai",
          "jobs": "70+ Open Jobs"
        },
      ];

      final industries = industriesJson
          .map((e) => FriendlyIndustry.fromJson(e))
          .toList();

      state = state.copyWith(
        pageState: PageState.success,
        data: industries,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint("catch fetchFriendlyIndustries - ${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
