import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/ui/pages/auth/signup/components/work_status_view.dart';
import 'package:dei_champions/ui/pages/auth/signup/widgets/signup_back_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';
import '../components/registration_progress_bar.dart';
import '../components/signup_header.dart';

class OtherInfo extends StatefulWidget {
  final VoidCallback onNext;

  const OtherInfo({super.key, required this.onNext});

  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  final otherInfoFormKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? selectedWorkStatus;
  // Create FocusNodes
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  final _statusFocus = FocusNode();
  final _cityFocus = FocusNode();


  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _statusFocus.dispose();
    _cityFocus.dispose();
    debugPrint("OtherInfo dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        FocusTraversalGroup(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child:Form(
                      key: otherInfoFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SignupHeaderSmall(title: "Basic Details",subTitle: 'Lets start creating your profile',),
                          // Signup Form
                          RegistrationProgressBar(),
                          gapH16(),
                          gapH16(),
                          // Password Field
                          TransparentFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocus,
                            hint: AppStrings.password,
                            label: AppStrings.password,
                            icon: Icons.lock_outline,
                            textInputAction: TextInputAction.next,
                            isPassword: true,
                            validator: AppValidators.signupPassword,
                            nextFocusNode:_confirmPasswordFocus ,
                          ),

                          gapH20(),

                          // Confirm Password Field
                          TransparentFormField(
                            controller: _confirmPasswordController,
                            focusNode: _confirmPasswordFocus,
                            hint: 'Confirm Password',
                            label: 'Confirm Password',
                            icon: Icons.lock_outline,
                            textInputAction: TextInputAction.next,
                            isPassword: true,
                            validator: AppValidators.confirmPassword(
                              _passwordController,
                            ),
                            nextFocusNode:_statusFocus ,

                          ),

                          gapH20(),
                          WorkStatusView(
                            formKey: otherInfoFormKey,
                            onStatusChanged: (value) {
                              setState(() {
                                selectedWorkStatus = value;
                              });
                              FocusScope.of(context).requestFocus(_cityFocus);
                            },
                          ),
                          gapH20(),
                          // Conditionally show location field
                          // if (selectedWorkStatus != null &&
                          //     selectedWorkStatus!.isNotEmpty) ...[
                          //   TransparentFormField(
                          //     controller: _cityController,
                          //     focusNode: _cityFocus,
                          //     hint: AppStrings.city,
                          //     label: AppStrings.city,
                          //     icon: Icons.location_city_outlined,
                          //     textInputAction: TextInputAction.done,
                          //     validator: AppValidators.fieldEmpty(AppStrings.city),
                          //     textCapitalization: TextCapitalization.words,
                          //     // onFieldSubmitted: (_) {
                          //     //   FocusScope.of(context).requestFocus();
                          //     // },
                          //   ),
                          //
                          //   gapH20(),
                          // ],

                        ],
                      ),
                    ),
                  ),
                  _nextButton(),
                  gapH20()
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 40,
          child: SignupBackButton(),
        ),


      ],
    );
  }

  Widget _nextButton() {
    return Consumer(
        builder: (context, ref, _) {
          final regController = ref.read(registerProvider.notifier);
          final state = ref.watch(registerProvider);
          final skip = ref.watch(signupFlowControllerProvider);
          return SafeArea(
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 80,
                child: CustomThemeButton(
                  color: context.colors.buttonPrimaryColor,
                  height: 56,
                  radius: 16,
                  isExpanded: true,
                  alignRight: true,
                  isLoading:state.pageState == PageState.loading ,
                  onTap: () {
                    if (otherInfoFormKey.currentState?.validate() == true) {
                      regController.setPassword(_confirmPasswordController.text.trim());
                      regController.setWorkStatus(selectedWorkStatus ?? "");
                      widget.onNext();
                    }
                  },
                  child: Text(
                    AppStrings.next,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
