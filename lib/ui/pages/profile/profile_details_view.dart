import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import 'components/about_me.dart';
import 'components/basic_details.dart';
import 'components/contact_details.dart';
import 'components/education_details.dart';
import 'components/experience_details.dart';
import 'components/key_skills.dart';
import 'components/resume_details.dart';

class ProfileDetailsView extends ConsumerWidget {
  final bool openEditResume;
  const ProfileDetailsView({super.key,  this.openEditResume = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
    return SafeArea(
      child:state.pageState == PageState.error ?  SomethingWentWrong() :  SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [BasicDetails(), ContactDetails(), AboutMe(),MyKeySkill(),ExperienceDetails(), EducationDetails(),ResumeDetails(openEditResume: openEditResume)],
        ),
      ),
    );
  }
}
