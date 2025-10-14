import 'package:flutter/material.dart';

import '../../../constants/app_drawables.dart';
import 'components/dashboard_item_card.dart';

class DashBoardAllScreen extends StatelessWidget {
  DashBoardAllScreen({super.key});

  final List<DashboardItemModel> items = [
    DashboardItemModel("Interview Schedules", "1568", 25, AppDrawables.bank, "interview"),
    DashboardItemModel("Applied Jobs", "284", 5, AppDrawables.computer, "applied"),
    DashboardItemModel("Saved Jobs", "2", 7, AppDrawables.save, "saved"),
    DashboardItemModel("Task Bids Won", "136", 12, AppDrawables.doc, "bids"),
    DashboardItemModel("Application Sent", "985", 5, AppDrawables.headphone, "application"),
    DashboardItemModel("Profile Viewed", "165", 15, AppDrawables.lamp, "profile"),
    DashboardItemModel("New Messages", "2356", -2, AppDrawables.look, "messages"),
    DashboardItemModel("Articles Added", "254", 2, AppDrawables.man, "articles"),
    DashboardItemModel("CV Added", "548", 48, AppDrawables.open, "cv"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      itemBuilder: (context, index) {
        return DashboardCard(item: items[index]);
      },
      separatorBuilder: (c, s) => Divider(color: Colors.white70, height: 12),
    );
  }
}
