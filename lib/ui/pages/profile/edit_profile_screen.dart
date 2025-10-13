import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../widgets/others/custom_theme_button.dart';
import 'edit_profile_components/edit_basic_information.dart';
import 'edit_profile_components/edit_education_info.dart';
import 'edit_profile_components/edit_job_preference_info.dart';
import 'edit_profile_components/edit_location_information.dart';
import 'edit_profile_components/edit_resume.dart';
import 'edit_profile_components/edit_skill_info.dart';
import 'edit_profile_components/edit_work_experience_info.dart';


class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
            _bottomButtons(), // 👈 stays visible always
          ],
        ),
      ),
    );

  }
  Widget _bottomButtons(){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child:   CustomThemeButton(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.close_rounded,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                    gapW6(),
                    Text('Cancel',style: navigatorKey.currentContext!.textTheme.titleMedium?.copyWith(color: AppColors.primaryColor)),
                  ],
                ),
                radius: 8,
                color: Colors.white,
                borderColor:AppColors.primaryColor,
                // padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
              ),
            ),
            gapW16(),
            Expanded(
              child:   CustomThemeButton(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                    gapW6(),
                    Text('Save',style: navigatorKey.currentContext!.textTheme.titleMedium?.copyWith(color: Colors.white)),
                  ],
                ),
                radius: 8,
                color: AppColors.primaryColor,
                borderColor:AppColors.primaryColor,
                // padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
