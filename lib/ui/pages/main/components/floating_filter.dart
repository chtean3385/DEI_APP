import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_navigator.dart';
import '../../../../providers/controllers/job/employee_search_jobs_controller.dart';

/// A reusable non-circular Floating Action Button with icon + label.
/// Border radius = 8, elevated, customizable icon/label/color.
class FloatingFilterFab extends StatelessWidget {


  const FloatingFilterFab({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;
    return Material(
      elevation: 6,
      color: colorTheme.themBasedWhite,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: ()=>AppNavigator.loadJobSearchResultScreen(params:EmployeeSearchJobsParams(showFilter: true) ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tune, size: 20, color: colorTheme.black87),
              const SizedBox(width: 8),
              Text(
                "Filter",
                style: TextStyle(
                  color: colorTheme.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

