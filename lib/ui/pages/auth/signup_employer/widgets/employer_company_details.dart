import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../common/email_suggestion_field.dart';
import '../../signup/components/registration_progress_bar.dart';
import '../../signup/components/signup_header.dart';
import '../../signup/widgets/signup_back_button.dart';
import 'company_employee_size.dart';

class EmployerCompanyDetails extends StatefulWidget {
  final VoidCallback onNext;

  const EmployerCompanyDetails({super.key, required this.onNext});

  @override
  _EmployerCompanyDetailsState createState() => _EmployerCompanyDetailsState();
}

class _EmployerCompanyDetailsState extends State<EmployerCompanyDetails>
    with SingleTickerProviderStateMixin {
  final companyDetailsFormKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _companyEmailController = TextEditingController();
  final _designationController = TextEditingController();
  final _companySizeController = TextEditingController();
  final _webSiteController = TextEditingController();

  // Create FocusNodes
  final _companyNameFocus = FocusNode();
  final _designationFocus = FocusNode();
  final _companyEmailFocus = FocusNode();
  final _companySizeFocus = FocusNode();
  final _webSiteFocus = FocusNode();



  @override
  void dispose() {
    _companyNameController.dispose();
    _companyEmailController.dispose();
    _designationController.dispose();
    _companySizeController.dispose();
    _webSiteController.dispose();
    // Dispose FocusNodes
    _companyNameFocus.dispose();
    _designationFocus.dispose();
    _companyEmailFocus.dispose();
    _companySizeFocus.dispose();
    _webSiteFocus.dispose();
    debugPrint("BasicPersonalInfo dispose");

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: BouncingScrollPhysics(),
              child: Form(
                key: companyDetailsFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EmployerSignupHeaderSmall(title: "Company Details" ,subTitle: 'Information about your organization' ,),
                    gap16(),
                    RegistrationProgressBar(isEmployer: true),
                    gap16(),
                    gap16(),
                    TransparentFormField(
                      controller: _companyNameController,
                      focusNode: _companyNameFocus,
                      hint: AppStrings.enterCompanyName,
                      label: AppStrings.companyName,
                      autofillHints: [AutofillHints.telephoneNumber],
                      textInputAction: TextInputAction.next,
                      icon: Icons.apartment,
                      validator: AppValidators.fieldEmpty(AppStrings.companyName),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      nextFocusNode: _companyEmailFocus,

                    ),
                    gap20(),
                    EmailSuggestionField(
                      controller: _companyEmailController,
                      focusNode: _companyEmailFocus,
                      nextFocus: _designationFocus,
                      hint: AppStrings.enterOfficialEmailId,
                      label: AppStrings.officialEmailId,
                    ),
                    // TransparentFormField(
                    //   controller: _companyEmailController,
                    //   focusNode: _companyEmailFocus,
                    //   hint: AppStrings.enterCompanyEmail,
                    //   label: AppStrings.companyEmail,
                    //   icon: Icons.email_outlined,
                    //   textInputAction: TextInputAction.next,
                    //   keyboardType: TextInputType.emailAddress,
                    //   validator: AppValidators.email,
                    //   textCapitalization: TextCapitalization.none,
                    //   nextFocusNode: _designationFocus,
                    // ),
                    gap20(),
                    TransparentFormField(
                      controller: _designationController,
                      focusNode: _designationFocus,
                      hint: AppStrings.enterDesignation,
                      label: AppStrings.designation,
                      icon: Icons.badge_outlined,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      validator: AppValidators.fieldEmpty(AppStrings.designation),
                      nextFocusNode: _companySizeFocus,

                    ),
                    gap20(),
                    CompanyEmployeeSize(controller:_companySizeController ,focusNode: _companySizeFocus,nextFocus: _webSiteFocus),

                    gap20(),
                    TransparentFormField(
                      controller: _webSiteController,
                      focusNode: _webSiteFocus,
                      hint: AppStrings.enterWebsite,
                      label: AppStrings.website,
                      icon: Icons.language,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      textCapitalization: TextCapitalization.words,
                    ),
                    gap20(),
                    _nextButton(),
                    gap16(),

                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 25,left: 10,child: SignupBackButton(isEmployer: true))

        ],
      ),
    );
  }

  Widget _nextButton() {
    return CustomThemeButton(
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: false,
      alignRight: true,
      onTap: () {
        if (companyDetailsFormKey.currentState?.validate() == true) {
        widget.onNext();
        }
      },
      child: Text(
        AppStrings.next,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
