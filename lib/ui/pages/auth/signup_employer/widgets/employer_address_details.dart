import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_validators.dart';
import 'package:dei_champions/ui/pages/auth/signup_employer/widgets/select_city.dart';
import 'package:dei_champions/ui/pages/auth/signup_employer/widgets/select_state.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../../signup/components/registration_progress_bar.dart';
import '../../signup/components/signup_header.dart';
import '../../signup/widgets/signup_back_button.dart';

class EmployerAddressDetails extends StatefulWidget {
  final VoidCallback onNext;

  const EmployerAddressDetails({super.key, required this.onNext});

  @override
  _EmployerAddressDetailsState createState() => _EmployerAddressDetailsState();
}

class _EmployerAddressDetailsState extends State<EmployerAddressDetails>
    with SingleTickerProviderStateMixin {
  final addressDetailsFormKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _picCodeController = TextEditingController();

  // Create FocusNodes
  final _addressFocus = FocusNode();
  final _stateFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _pinCodeFocus = FocusNode();

  @override
  void dispose() {
    _addressController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _picCodeController.dispose();
    // Dispose FocusNodes
    _addressFocus.dispose();
    _stateFocus.dispose();
    _cityFocus.dispose();
    _pinCodeFocus.dispose();
    debugPrint("EmployerAddressDetails dispose");

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
                key: addressDetailsFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    EmployerSignupHeaderSmall(
                      title: "Address Details",
                      subTitle: 'Your company/business address information',
                    ),
                    gap16(),
                    RegistrationProgressBar(isEmployer: true),
                    gap16(),
                    gap16(),
                    TransparentFormField(
                      controller: _addressController,
                      focusNode: _addressFocus,
                      hint: AppStrings.enterCompleteAddress,
                      label: AppStrings.completeAddress,
                      autofillHints: [AutofillHints.addressCityAndState],
                      textInputAction: TextInputAction.next,
                      icon: Icons.apartment,
                      validator: AppValidators.fieldEmpty(
                        AppStrings.completeAddress,
                      ),
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      nextFocusNode:_stateFocus ,
                    ),
                    gap20(),
                    SelectState(
                      controller: _stateController,
                      focusNode: _stateFocus,
                      nextFocus: _cityFocus,
                    ),
                    gap20(),
                    SelectCity(
                      controller: _cityController,
                      focusNode: _cityFocus,
                      nextFocus: _pinCodeFocus,
                    ),

                    gap20(),
                    TransparentFormField(
                      controller: _picCodeController,
                      focusNode: _pinCodeFocus,
                      hint: AppStrings.enterPinCode,
                      label: AppStrings.pinCode,
                      icon: Icons.language,
                      textInputAction: TextInputAction.done,
                      validator: AppValidators.fieldEmpty(AppStrings.pinCode),
                      keyboardType: TextInputType.phone,
                      maxLength: 6,
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
        if (addressDetailsFormKey.currentState?.validate() == true) {
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
