import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import '../auth/guest/guest_promt_widget.dart';
import '../home/components/boost/profile_completion_slider.dart';
import 'components/about_me.dart';
import 'components/basic_details.dart';
import 'components/category_details.dart';
import 'components/contact_details.dart';
import 'components/education_details.dart';
import 'components/experience_details.dart';
import 'components/key_skills.dart';
import 'components/open_edit_section.dart';
import 'components/resume_details.dart';

class ProfileDetailsView extends ConsumerWidget {
  final bool isGuest;
  final EmployeeProfileFieldsParams? params;

  const ProfileDetailsView({super.key, this.params,this.isGuest = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(isGuest) {
      return Center(child: GuestPromptWidget(
        subTitle: "You're browsing as a guest.\nSign in to access your profile and manage your job activity in one place."
        ,
      ));
    }
    final state = ref.watch(employeeProfileProvider);
    final stateCityList = ref.watch(stateListProvider);
    return SafeArea(
      child: state.pageState == PageState.error
          ? SomethingWentWrong()
          : SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OpenEditSectionBuilder(params: params),
                  BasicDetails(),
                  ContactDetails(),
                  AboutMe(),
                  CategoryDetails(),
                  MyKeySkill(),
                  ExperienceDetails(),
                  EducationDetails(),
                  ResumeDetails(),

                ],
              ),
            ),
    );
  }
}
