import 'package:flutter/material.dart';

import '../../../../constants/app_drawables.dart';
import '../../../../widgets/others/animated_wrapper.dart';
import '../../All/components/dashboard_item_card.dart';

class EmployerDashBoardAllScreen extends StatelessWidget {
  EmployerDashBoardAllScreen({super.key});

  final List<DashboardItemModel> items = [
    DashboardItemModel("Interview Schedules", "1568", 25, AppDrawables.computer, "interview"),
    DashboardItemModel("Applied Jobs", "284", 5, AppDrawables.bank, "applied"),
    DashboardItemModel("Task Bids Won", "136", 12, AppDrawables.lamp, "bids"),
    DashboardItemModel("Application Sent", "985", 5, AppDrawables.headphone, "application"),
    DashboardItemModel("Profile Viewed", "165", 15, AppDrawables.look, "profile"),
    DashboardItemModel("New Messages", "2356", -2, AppDrawables.open, "messages"),
    DashboardItemModel("Articles Added", "254", 2, AppDrawables.doc, "articles"),
    DashboardItemModel("CV Added", "548", 48, AppDrawables.man, "cv"),
  ];
  @override
  Widget build(BuildContext context) {
    return AnimatedSignupWrapper(
      child: ListView.separated(
        itemCount: items.length,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) {
          return DashboardCard(item: items[index]);
        },
        separatorBuilder: (c, s) => Divider(color: Colors.white70, height: 12),
      ),
    );
  }
}
