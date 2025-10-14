import 'package:flutter/material.dart';

import '../../../constants/app_drawables.dart';
import 'components/dashboard_item_card.dart';

class DashBoardAllScreen extends StatelessWidget {
  DashBoardAllScreen({super.key});

  final List<DashboardItem> items = [
    DashboardItem("Interview Schedules", "1568", 25, AppDrawables.bank),
    DashboardItem("Applied Jobs", "284", 5, AppDrawables.computer),
    DashboardItem("Saved Jobs", "2", 7, AppDrawables.save),
    DashboardItem("Task Bids Won", "136", 12, AppDrawables.doc),
    DashboardItem("Application Sent", "985", 5, AppDrawables.headphone),
    DashboardItem("Profile Viewed", "165", 15, AppDrawables.lamp),
    DashboardItem("New Messages", "2356", -2, AppDrawables.look),
    DashboardItem("Articles Added", "254", 2, AppDrawables.man),
    DashboardItem("CV Added", "548", 48, AppDrawables.open),
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
