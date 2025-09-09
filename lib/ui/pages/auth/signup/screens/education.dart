import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../widgets/education/course_selector.dart';
import '../widgets/education/course_type.dart';
import '../widgets/education/highest_qualification.dart';
import '../widgets/education/specialization.dart';
import '../widgets/education/university.dart';
import '../widgets/education/year_selector.dart';
import '../widgets/signup_back_button.dart';

class Education extends StatefulWidget {
  final VoidCallback onNext;

  const Education({super.key, required this.onNext});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final formKeyEducation = GlobalKey<FormState>();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final _universityFocus = FocusNode();
  // final List<String> _selectedSkills = [];

  @override
  void dispose() {
    skillController.dispose();
    universityController.dispose();
    _universityFocus.dispose();
    super.dispose();
  }

  String selectedNoticePeriod = "";
  String selectedCourse = "";
  String selectedCourseType = "";
  String selectedSpecialization = "";
  String selectedStartingYear = "";
  String selectedPassingYear = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FocusTraversalGroup(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Form(
                      key: formKeyEducation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SignupHeaderSmall(
                            title: "Education",
                            subTitle:
                                'Let’s fill your educational qualifications',
                          ),
                          RegistrationProgressBar(),
                          gapH16(),
                          gapH16(),
                          HighestQualification(
                            selectedPeriod: selectedNoticePeriod,
                            onChanged: (period) {
                              setState(() {
                                selectedNoticePeriod = period;
                                formKeyEducation.currentState?.validate();
                              });
                            },
                          ),

                          gapH20(),

                        if(selectedNoticePeriod.isNotEmpty)  Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: CourseSelector(
                              courses: AppStrings.courses,
                              selectedCourse: selectedCourse,
                              initiallyVisible: 7,
                              onChanged: (value) {
                                setState(() {
                                  selectedCourse = value;
                                });
                              },
                            ),
                          ),

                          gapH20(),

                          if(selectedCourse.isNotEmpty)   CourseTypeSelector(
                            selectedType: selectedCourseType,
                            onChanged: (type) {
                              setState(() {
                                selectedCourseType = type;
                                formKeyEducation.currentState?.validate();
                              });
                            },
                          ),
                          gapH20(),

                          if(selectedCourseType.isNotEmpty)  Align(
                            alignment: AlignmentGeometry.centerLeft,
                            child: SpecializationSelector(
                              specializations: AppStrings.specializations,
                              selectedSpecialization: selectedSpecialization,
                              initiallyVisible: 7,
                              onChanged: (value) {
                                setState(() {
                                  selectedSpecialization = value;
                                });
                              },
                            ),
                          ),

                          gapH20(),
                          if(selectedSpecialization.isNotEmpty)   UniversityField(controller: universityController,focusNode: _universityFocus),
                          gapH20(),
                          // Starting Year
                          if(universityController.text.isNotEmpty)   YearSelector(
                            title: "Starting Year",
                            selectedYear: selectedStartingYear,
                            onChanged: (year) {
                              print("Selected Starting Year: $year");
                              setState(() {
                                selectedStartingYear = year;
                              });
                            },
                          ),
                          gapH20(),

          // Passing Year
                          if(selectedStartingYear.isNotEmpty)   YearSelector(
                            title: "Passing Year",
                            selectedYear: selectedPassingYear,
                            onChanged: (year) {
                              print("Selected Passing Year: $year");
                              setState(() {
                                selectedPassingYear = year;
                              });
                            },
                          ),


                        ],
                      ),
                    ),
                  ),
                  _nextButton(),
                  gapH20(),
                ],
              ),
            ),
          ),
        ),
        const Positioned(left: 10, top: 40, child: SignupBackButton()),
      ],
    );
  }

  Widget _nextButton() {
    return SafeArea(
      child: CustomThemeButton(
        color: AppColors.primaryColor,
        height: 56,
        radius: 16,
        isExpanded: false,
        alignRight: true,
        onTap: () {
          if (formKeyEducation.currentState?.validate() == true) {
            widget.onNext();
          }
        },
        child: Text(
          AppStrings.next,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
