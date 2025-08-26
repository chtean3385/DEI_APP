import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/auth/signup/components/work_status_view.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../../../widgets/others/custom_theme_button.dart';

class OtherInfo extends StatefulWidget {
  final VoidCallback onNext;

  const OtherInfo({super.key, required this.onNext});

  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  final formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();
  String? selectedWorkStatus;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          gap20(),
          WorkStatusView(
            formKey: formKey,
            onStatusChanged: (value) {
              setState(() {
                selectedWorkStatus = value;
              });
            },
          ),
          gap20(),
          // Conditionally show location field
          if (selectedWorkStatus != null &&
              selectedWorkStatus!.isNotEmpty) ...[
            TransparentFormField(
              controller: _cityController,
              hint: AppStrings.city,
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty(AppStrings.city),
              textCapitalization: TextCapitalization.words,
            ),

            gap20(),
          ],
          _nextButton(),
          gap16(),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return CustomThemeButton(
      color: AppColors.primaryColor,
      height: 56,
      radius: 16,
      isExpanded: true,
      onTap: () {
        if (formKey.currentState?.validate() == true) {
          widget.onNext();
        }
      },
      child: Text(
        AppStrings.signup,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
