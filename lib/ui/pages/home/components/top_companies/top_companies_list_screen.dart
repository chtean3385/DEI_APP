import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_styles.dart';
import 'components/TopCompaniesFilterOptionsBar.dart';
import 'components/top_companies_vertical_list_veiw.dart';

class TopCompanyListScreen extends StatelessWidget {
  TopCompanyListScreen({Key? key}) : super(key: key);

  final List<String> categories = [
    "Company type",
    "Location",
    "Industry",
    "Department",
    "Experience",
    "Nature of business", // 🆕 added
    "Job posting date", // 🆕 added
  ];

  String selectedCategory = "Company type";

  final Map<String, List<Map<String, dynamic>>> filterOptions = {
    "Company type": [
      {"label": "B2C", "count": 863},
      {"label": "B2B", "count": 346},
      {"label": "Startup", "count": 120},
      {"label": "Unicorn", "count": 78},
      {"label": "Corporate", "count": 156},
    ],
    "Location": [
      {"label": "Bangalore", "count": 356},
      {"label": "Hyderabad", "count": 220},
      {"label": "Chennai", "count": 180},
      {"label": "Mumbai", "count": 142},
      {"label": "Delhi NCR", "count": 89},
    ],
    "Industry": [
      {"label": "IT Services", "count": 50},
      {"label": "Software", "count": 300},
      {"label": "Consulting", "count": 120},
      {"label": "Technology", "count": 50},
      {"label": "Internet", "count": 200},
      {"label": "Hardware", "count": 90},
      {"label": "BFSI", "count": 50},
      {"label": "Insurance", "count": 150},
      {"label": "Banking", "count": 120},
    ],
    "Department": [
      {"label": "Engineering", "count": 310},
      {"label": "Design", "count": 75},
      {"label": "Sales", "count": 120},
      {"label": "Marketing", "count": 95},
      {"label": "Finance", "count": 60},
    ],
    "Experience": [
      {"label": "0-1 years", "count": 50},
      {"label": "1-3 years", "count": 120},
      {"label": "3-5 years", "count": 95},
      {"label": "5-7 years", "count": 60},
      {"label": "7+ years", "count": 45},
    ],
    // 🆕 New category
    "Nature of business": [
      {"label": "B2B", "count": 200},
      {"label": "B2C", "count": 300},
      {"label": "SaaS", "count": 120},
      {"label": "D2C", "count": 90},
      {"label": "PaaS", "count": 60},
    ],
    // 🆕 New category
    "Job posting date": [
      {"label": "<= 7 days", "count": 180},
      {"label": "<= 15 days", "count": 320},
      {"label": "Older", "count": 150},
    ],
  };

  final Map<String, Set<String>> selectedOptionsMap = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBarCommon(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH16(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Top companies", style: theme.headlineMedium),
            ),
            gapH16(),
            // Job list
            Expanded(child: TopCompaniesVerticalListView()),

            // Sticky bottom filter bar
            CommonFilterOptionsBar(
              filters: categories,
              // 👈 your category list
              options: filterOptions,
              // 👈 your options map
              initialSelected: selectedOptionsMap,
              // 👈 selected options state
              onApply: (selected) {
                print("✅ User applied filters: $selected");
                // update your state / call API here
              },
              onClearAll: () {
                print("🗑 All filters cleared");
                selectedOptionsMap.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
