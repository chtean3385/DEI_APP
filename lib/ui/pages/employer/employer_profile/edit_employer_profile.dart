import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/others/animated_wrapper.dart';
import '../../profile/edit_profile_components/edit_profile_action_button.dart';
import 'edit_employer_profile_components/edit_company_gallery_images.dart';
import 'edit_employer_profile_components/edit_cover_image.dart';
import 'edit_employer_profile_components/edit_employer_about_company_info.dart';
import 'edit_employer_profile_components/edit_employer_basic_information.dart';
import 'edit_employer_profile_components/edit_employer_contact_details.dart';
import 'edit_employer_profile_components/edit_employer_people_culture.dart';
import 'edit_employer_profile_components/edit_employer_recruitment_info.dart';

class EditEmployerProfileScreen extends StatelessWidget {
  const EditEmployerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(
        title: "Edit Employer Details",
        titleStyleSmall: true,
      ),
      body: AnimatedSignupWrapper(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Basic Information
                      EditEmployerBasicInformation(),
                      gapH16(),
                      // Contact Information
                      EditEmployerContactInformation(),
                      gapH16(),
                      // Company Image Gallery
                      EditEmployerImageGallery(),
                      gapH16(),
                      // About Us
                      EditEmployerAboutCompany(),
                      gapH16(),
                      // Recruitments
                      EditEmployerRecruitmentInfo(),
                      gapH16(),
                      // People
                      EditEmployerPeopleAndCulture(),
                      gapH16(),
                      // Banner Image
                      EditEmployerCoverImage(),
                      gapH16(),


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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
