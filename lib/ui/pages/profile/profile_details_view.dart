import 'package:flutter/material.dart';

import 'components/about_me.dart';
import 'components/basic_details.dart';
import 'components/contact_details.dart';
import 'components/education_details.dart';
import 'components/experience_details.dart';
import 'components/key_skills.dart';
import 'components/resume_details.dart';

class ProfileDetailsView extends StatelessWidget {
  final bool openEditResume;
  const ProfileDetailsView({super.key,  this.openEditResume = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [BasicDetails(), ContactDetails(), AboutMe(),MyKeySkill(),ExperienceDetails(), EducationDetails(),ResumeDetails(openEditResume: openEditResume)],
        ),
      ),
    );
  }
}
