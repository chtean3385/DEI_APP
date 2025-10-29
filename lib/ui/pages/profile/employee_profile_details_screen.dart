import 'package:dei_champions/ui/pages/profile/profile_details_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

class EmployeeProfileDetailsScreen extends StatelessWidget {
  const EmployeeProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarCommon() ,
      body: ProfileDetailsView(openEditResume: true ),
    );
  }
}
