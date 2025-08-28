import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../widgets/employment/salary.dart';
import '../widgets/preference/work_location_field.dart';
import '../widgets/signup_back_button.dart';

class CareerPreferences extends StatefulWidget {
  final VoidCallback onNext;

  const CareerPreferences({super.key, required this.onNext});

  @override
  State<CareerPreferences> createState() => _CareerPreferencesState();
}

class _CareerPreferencesState extends State<CareerPreferences> {
  final formKeyCareer = GlobalKey<FormState>();
  final TextEditingController preferSalaryController = TextEditingController();
  final TextEditingController preferWorkLocationController =
      TextEditingController();
  final _preferSalaryFocus = FocusNode();
  final _preferWorkLocationFocus = FocusNode();
  final List<String> selectedLocations = [];

  @override
  void dispose() {
    preferSalaryController.dispose();
    preferWorkLocationController.dispose();

    _preferSalaryFocus.dispose();
    _preferWorkLocationFocus.dispose();
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
                      key: formKeyCareer,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SignupHeaderSmall(
                            title: "Career Preferences",
                            subTitle: 'Let’s fill your preferences ',
                          ),
                          RegistrationProgressBar(),
                          gap16(),
                          gap16(),
                          SalaryWidget(controller: preferSalaryController,focusNode: _preferSalaryFocus,nextNode:_preferWorkLocationFocus ),
          
                          gap20(),
          
                          // usage
                          WorkLocationField(
                            controller: preferWorkLocationController,
                            focusNode: _preferWorkLocationFocus,
                          ),
          
                          gap20(),
                        ],
                      ),
                    ),
                  ),
                  _nextButton(),
                  gap20(),
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
          if (formKeyCareer.currentState?.validate() == true) {
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
