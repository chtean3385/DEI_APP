import 'package:flutter/material.dart';
import '../../../widgets/others/app_bar_common.dart';
import 'components/notification_view.dart';

class EmployeeNotificationsScreen extends StatelessWidget {
  const EmployeeNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        title: "Notifications",
        arrowLeft: true,
        titleStyleSmall: true,
        actions: [MarkAllRead()],
      ),
      body: NotificationView(),
    );
  }
}
