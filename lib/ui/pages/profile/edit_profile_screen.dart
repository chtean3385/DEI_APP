import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'edit_profile_components/edit_basic_information.dart';
import 'edit_profile_components/edit_location_information.dart';
import 'edit_profile_components/edit_skill_info.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Edit Profile Details",titleStyleSmall: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EditBasicInformation(),
              gapH16(),
              EditLocationInformation(),
              gapH16(),
              EditSkillInformation()
            ],
          ),
        ),
      ),
    );
  }
}
