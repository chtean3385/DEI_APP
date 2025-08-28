// employment_screen.dart
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/current_company.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/current_job.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/department_type.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/industry_type.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/job_role_type.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/employment/role_category_type.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_drawables.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/backround_image_overlay.dart';
import '../components/gradient_overlay.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';
import '../widgets/employment/notice_period.dart';
import '../widgets/employment/salary.dart';
import '../widgets/employment/work_experience.dart';
import '../widgets/signup_back_button.dart';
import '../widgets/employment/work_duration.dart';

class EmploymentScreen extends StatefulWidget {
  final VoidCallback onNext;

  const EmploymentScreen({super.key, required this.onNext});

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
  final employmentFormKey = GlobalKey<FormState>();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController monthsController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController workDurationController = TextEditingController();
  final TextEditingController workedTillDurationController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController industryController = TextEditingController();
  final TextEditingController roleCategoryController = TextEditingController();
  final TextEditingController jobRoleController = TextEditingController();
  String? selectedWorkStatus;
  bool isCurrentlyEmployed = true;
  String selectedNoticePeriod = "";

  // Create FocusNodes
  final _yearFocus = FocusNode();
  final _monthFocus = FocusNode();
  final _jobTitleFocus = FocusNode();
  final _companyNameFocus = FocusNode();
  final _workDurationFocus = FocusNode();
  final _workTillFocus = FocusNode();
  final _annualSalaryFocus = FocusNode();
  final _noticePeriodFocus = FocusNode();
  final _industryTypeFocus = FocusNode();
  final _departmentFocus = FocusNode();
  final _roleCategoryFocus = FocusNode();
  final _jobRoleFocus = FocusNode();

  @override
  void dispose() {
    yearsController.dispose();
    monthsController.dispose();
    jobTitleController.dispose();
    companyController.dispose();
    salaryController.dispose();
    departmentController.dispose();
    workDurationController.dispose();
    workedTillDurationController.dispose();
    industryController.dispose();
    roleCategoryController.dispose();
    jobRoleController.dispose();

    _yearFocus.dispose();
    _monthFocus.dispose();
    _jobTitleFocus.dispose();
    _companyNameFocus.dispose();
    _workDurationFocus.dispose();
    _workTillFocus.dispose();
    _annualSalaryFocus.dispose();
    _noticePeriodFocus.dispose();
    _industryTypeFocus.dispose();
    _departmentFocus.dispose();
    _roleCategoryFocus.dispose();
    _jobRoleFocus.dispose();
    super.dispose();
  }

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
                      key: employmentFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SignupHeaderSmall(
                            title: "Employment",
                            subTitle: 'Lets fill your professional experience',
                          ),
                          // Signup Form
                          RegistrationProgressBar(),
                          gap16(),
                          gap16(),
                          EmploymentStatusWidget(
                            isEmployed: isCurrentlyEmployed,
                            onChanged: (value) {
                              setState(() {
                                isCurrentlyEmployed = value;
                              });
                            },
                          ),
                          gap20(),

                          // Total Work Experience
                          ExperienceWidget(
                            yearsController: yearsController,
                            monthsController: monthsController,
                            focusNode1: _yearFocus,
                            focusNode2: _monthFocus,
                            nextFocus:_jobTitleFocus ,
                          ),
                          gap20(),

                          CurrentJob(controller: jobTitleController,focusNode: _jobTitleFocus,nextFocus:_companyNameFocus),
                          gap20(),
                          CurrentCompany(controller: companyController,focusNode: _companyNameFocus,nextFocus:_workDurationFocus),

                          gap20(),
                          // Work Duration
                          WorkDuration(
                            controller: workDurationController,
                            isWorking: isCurrentlyEmployed,
                            workedTillController: workedTillDurationController,
                            workedTillFocusNode: _workTillFocus,
                            focusNode: _workDurationFocus,
                              nextFocus: isCurrentlyEmployed ? _annualSalaryFocus : _workTillFocus,nextFocus2:_annualSalaryFocus ,
                          ),
                          gap20(),
                          // Current Annual Salary
                          SalaryWidget(controller: salaryController,focusNode: _annualSalaryFocus,nextNode:_noticePeriodFocus ),
                          gap20(),
                          // Notice Period
                          NoticePeriodWidget(
                            selectedPeriod: selectedNoticePeriod,
                              focusNode: _noticePeriodFocus,
                            onChanged: (period) {
                              setState(() {
                                selectedNoticePeriod = period;
                                FocusScope.of(context).requestFocus(_industryTypeFocus);
                              });
                            },
                          ),
                          gap20(),

                          IndustryTypeField(controller: industryController,focusNode: _industryTypeFocus,nextFocus:_departmentFocus),
                          gap20(),
                          DepartmentField(controller: departmentController,focusNode: _departmentFocus,nextFocus:_roleCategoryFocus),
                          gap20(),
                          RoleCategoryField(controller: roleCategoryController,focusNode: _roleCategoryFocus,nextFocus:_jobRoleFocus),
                          gap20(),
                          JobRoleField(controller: jobRoleController,focusNode: _jobRoleFocus,),
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
        Positioned(left: 10, top: 40, child: SignupBackButton()),
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
          // if (formKey.currentState?.validate() == true) {
          widget.onNext();
          // }
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

class AutofillCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8EAED)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: const Color(0xFF6366F1),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Autofill with AI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'You can review and edit\nthe details later',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle upload resume
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF4285F4),
              elevation: 0,
              side: const BorderSide(color: Color(0xFF4285F4)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'Upload resume',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class EmploymentStatusWidget extends StatelessWidget {
  final bool isEmployed;
  final Function(bool) onChanged;

  const EmploymentStatusWidget({
    Key? key,
    required this.isEmployed,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Are you currently employed ?',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () => onChanged(true),
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isEmployed ? AppColors.primaryColor : Colors.white,
                      border: Border.all(
                        color: isEmployed
                            ? AppColors.primaryColor
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: isEmployed
                        ? const Center(
                            child: Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 8,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Yes',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            GestureDetector(
              onTap: () => onChanged(false),
              behavior: HitTestBehavior.translucent,
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: !isEmployed
                          ? AppColors.primaryColor
                          : Colors.white,
                      border: Border.all(
                        color: !isEmployed
                            ? AppColors.primaryColor
                            : Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'No',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool isDropdown;

  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.isDropdown = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4285F4)),
            ),
            suffixIcon: isDropdown
                ? const Icon(Icons.arrow_drop_down, color: Colors.grey)
                : null,
          ),
        ),
      ],
    );
  }
}
