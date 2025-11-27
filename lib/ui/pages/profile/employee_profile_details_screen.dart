import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/profile/profile_details_view.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_navigator.dart';
import '../home/components/boost/profile_completion_slider.dart';

class EmployeeProfileDetailsScreen extends StatelessWidget {
  final EmployeeProfileFieldsParams? params;
  const EmployeeProfileDetailsScreen({super.key,  this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBarCommon(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon:  Icon(Icons.edit, color: context.colors.black54, size: 25),
            onPressed: () =>
                AppNavigator.loadEditProfileScreen(),
          ),
        ),
      ]) ,
      body: ProfileDetailsView(params: params ),
    );
  }
}
