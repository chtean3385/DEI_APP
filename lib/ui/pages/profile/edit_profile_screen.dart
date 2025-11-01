import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'edit_profile_components/edit_basic_information.dart';
import 'edit_profile_components/edit_education_info.dart';
import 'edit_profile_components/edit_job_preference_info.dart';
import 'edit_profile_components/edit_location_information.dart';
import 'edit_profile_components/edit_profile_action_button.dart';
import 'edit_profile_components/edit_resume.dart';
import 'edit_profile_components/edit_skill_info.dart';
import 'edit_profile_components/edit_work_experience_info.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        title: "Edit Profile Details",
        titleStyleSmall: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EditBasicInformation(),
                    gapH16(),
                    EditLocationInformation(),
                    gapH16(),
                    EditSkillInformation(),
                    gapH16(),
                    EditEducationInformation(),
                    gapH16(),
                    EditWorkExpInformation(),
                    gapH16(),
                    EditJobPreferenceInfo(),
                    gapH16(),
                    EditResumeInformation(),
                  ],
                ),
              ),
            ),
            EditProfileActionButtons(isEmployee: true),
          ],
        ),
      ),
    );
  }
}
