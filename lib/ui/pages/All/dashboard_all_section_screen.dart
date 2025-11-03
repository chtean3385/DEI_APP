import 'package:flutter/material.dart';

import '../../../constants/app_drawables.dart';
import '../../../widgets/others/animated_wrapper.dart';
import 'components/dashboard_item_card.dart';

class DashBoardAllScreen extends StatelessWidget {
  DashBoardAllScreen({super.key});

  final List<DashboardItemModel> items = [
    DashboardItemModel("All Applied Applications", "11", 25, AppDrawables.computer, "All"),
    DashboardItemModel("All Saved Jobs", "4", 5, AppDrawables.bank, "Saved"),
    DashboardItemModel("Pending ", "2", 7, AppDrawables.save, "Pending"),
    DashboardItemModel("Accepted", "0", 12, AppDrawables.lamp, "Accepted"),
    DashboardItemModel("Interviewing", "0", 5, AppDrawables.headphone, "Interviewing"),
    DashboardItemModel("Negotiation", "0", 15, AppDrawables.look, "Negotiation"),
    DashboardItemModel("Hired", "1", -2, AppDrawables.open, "Hired"),
    DashboardItemModel("Rejected", "0", 2, AppDrawables.doc, "Rejected"),
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
