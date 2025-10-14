import 'package:flutter/material.dart';

import 'components/about_me.dart';
import 'components/basic_details.dart';
import 'components/contact_details.dart';
import 'components/education_details.dart';
import 'components/experience_details.dart';
import 'components/key_skills.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [BasicDetails(), ContactDetails(), AboutMe(),MyKeySkill(),ExperienceDetails(), EducationDetails()],
        ),
      ),
    );
  }
}
