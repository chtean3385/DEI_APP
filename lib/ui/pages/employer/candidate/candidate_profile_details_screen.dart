import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';

import 'components/about_candidate.dart';
import 'components/candidate_basic_details.dart';
import 'components/candidate_contact_details.dart';
import 'components/candidate_education_details.dart';
import 'components/candidate_experience_details.dart';
import 'components/candidate_key_skills.dart';
import 'components/candidate_resume_download.dart';


class CandidateProfileDetailsScreen extends StatelessWidget {
  const CandidateProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CandidateBasicDetails(),CandidateContactDetails(),AboutCandidate(),CandidateKeySkill(),CandidateExperienceDetails(), CandidateEducationDetails(),CandidateResumeDownload()],
          ),
        ),
      ),
    );
  }
}
