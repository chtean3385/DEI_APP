import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../profile/edit_profile_components/edit_cover_image.dart';
import '../../profile/edit_profile_components/edit_profile_action_button.dart';
import 'edit_employer_profile_components/edit_employer_basic_information.dart';
import 'edit_employer_profile_components/edit_employer_contact_details.dart';



class EditEmployerProfileScreen extends StatelessWidget {
  const EditEmployerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Edit Profile Details", titleStyleSmall: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Basic Information
                    // Contact Information
                    // Company Image Gallery
                    // About Us
                    // Recruitments
                    // People
                    // Banner Image
                    EditEmployerBasicInformation(),
                    gapH16(),
                    EditEmployerContactInformation(),
                    gapH16(),
                    EditEmployerCoverImage()
                    // EditLocationInformation(),
                    // gapH16(),
                    // EditSkillInformation(),
                    // gapH16(),
                    // EditEducationInformation(),
                    // gapH16(),
                    // EditWorkExpInformation(),
                    // gapH16(),
                    // EditJobPreferenceInfo(),
                    // gapH16(),
                    // EditResumeInformation(),
                  ],
                ),
              ),
            ),
            EditProfileActionButtons(
              onCancel: () {
                Navigator.pop(context);
              },
              onSave: () {
                // Implement your save logic here
              },
            )
          ],
        ),
      ),
    );

  }

}
