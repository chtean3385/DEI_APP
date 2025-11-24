import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';

class LetsConnectFormView extends ConsumerWidget {
  const LetsConnectFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(letsConnectProvider.notifier);
    final colorTheme = context.colors;
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Let's ",
                style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: 'Connect',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: colorTheme.buttonPrimaryColor,fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            gapH8(),
            Text(
              "Email us personally or complete the form below to set up a meeting or discuss an idea.",
              style: context.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),
            gapH8(),
            Text(
              "We will respond right away.",
              style: context.textTheme.labelMedium?.copyWith(color: Colors.green),
            ),
            gapH8(),

            _contactDetailsTile(Icons.email,"contact@company.com"),
            gapH8(),
            _contactDetailsTile(Icons.phone,"+91 90103432486"),
            gapH8(),
            _contactDetailsTile(Icons.location_on,"Your Company Address"),
            gapH8(),

            gapH16(),


            TransparentFormField(
              isRequired: true,
              controller: controller.firstNameController,
              hint: "First name",
              label: "First name",
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("First name"),
              textCapitalization: TextCapitalization.words,
            ),
            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.lastNameController,
              hint: "Last name",
              label: "Last name",
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("Last name"),
              textCapitalization: TextCapitalization.words,
            ),
            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.organisationController,
              hint: "Organisation / Company",
              label: "Name of Organisation / Company",
              icon: Icons.business_outlined,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("name of Organisation / Company"),
              textCapitalization: TextCapitalization.words,
            ),

            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.designationController,
              hint: "Your Designation",
              label: "Designation",
              icon: Icons.business_outlined,
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("Your Designation"),
              textCapitalization: TextCapitalization.words,
            ),

            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.mobileController,
              hint: AppStrings.enterMobile,
              label: AppStrings.mobile,
              autofillHints: [AutofillHints.telephoneNumber],
              textInputAction: TextInputAction.next,
              icon: Icons.phone_android,
              validator: AppValidators.phone,
              keyboardType: TextInputType.phone,
              maxLength: 10,
            ),
            gapH16(),
            // TransparentFormField(
            //   isRequired: true,
            //   controller: controller.emailController,
            //   hint: "your.email@company.com",
            //   label: "Official E-mail",
            //   icon: Icons.email_outlined,
            // ),
            // Email Field

            TransparentFormField(
              controller: controller.emailController,
              hint: "your.email@company.com",
              label: "Official E-mail",
              icon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
              validator: AppValidators.email,
            ),
            gapH16(),

            TransparentFormField(
              isRequired: true,
              controller: controller.descriptionController,
              hint: "Your message",
              label: "Query",
              textInputAction: TextInputAction.next,
              validator: AppValidators.fieldEmpty("Your message"),
              textCapitalization: TextCapitalization.words,
              minLines: 3,
              maxLength: 250,
              showCounter: true,
            ),
            gapH16(),
            TransparentDropdownField(
              isRequired: true,
              label: "Share your interest for getting in touch ",
              hint: "Select from the list",
              icon: Icons.work_outline,
              items: [
                "Partnership",
                "Career Opportunity",
                "Project Discussion",
                "General Inquiry",
                "Technical Support",
              ],
              value: controller.interestController.text,
              validator: AppValidators.dropDownFieldEmpty("your interest"),
              onChanged: (value) {
                controller.interestController.text = value.toString();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactDetailsTile(IconData,title){
    return Row(
      children: [
        Icon(IconData, size: 15, color: navigatorKey.currentContext!.colors.buttonPrimaryColor),
        gapW16(),
        Text(
          title,
          style: navigatorKey.currentContext!.textTheme.bodyMedium?.copyWith(color: navigatorKey.currentContext!.colors.black54),
        ),
      ],
    );
  }
}
