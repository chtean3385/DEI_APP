import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import 'lets_connect_contact_info.dart';

class LetsConnectFormView extends ConsumerWidget {
  const LetsConnectFormView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(letsConnectProvider.notifier);
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LetsConnectContactSection(),
            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.firstNameController,
              hint: "First name",
              label: "First name",
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.letsConnectFieldEmpty("First name"),
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (v){TextInputAction.next;},
            ),
            gapH16(),
            TransparentFormField(
              isRequired: true,
              controller: controller.lastNameController,
              hint: "Last name",
              label: "Last name",
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.letsConnectFieldEmpty("Last name"),
              textCapitalization: TextCapitalization.words,
              onFieldSubmitted: (v){TextInputAction.next;},
            ),
            gapH16(),
            TransparentDropdownField(
              isRequired: true,
              label: "Share your interest for getting in touch ",
              hint: "Select from the list",
              icon: Icons.work_outline,
              items: AppStrings.inquiryOptions.map((e) => e["label"] as String).toList(),
              value: controller.interestController.text,
              validator: AppValidators.dropDownFieldEmpty("your interest"),
              onChanged: (value) {
                controller.interestController.text = value.toString();
              },

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
              onFieldSubmitted: (v){TextInputAction.next;},
            ),
            gapH16(),
            TransparentFormField(
              controller: controller.emailController,
              hint: "your email address",
              label: "E-mail",
              icon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
              validator: AppValidators.email,
              onFieldSubmitted: (v){TextInputAction.next;},
            ),
            gapH16(),

            TransparentFormField(
              isRequired: true,
              controller: controller.descriptionController,
              hint: "Your message",
              label: "Query",
              textInputAction: TextInputAction.done,
              validator: AppValidators.letsConnectFieldEmpty("Query"),
              textCapitalization: TextCapitalization.words,
              minLines: 3,
              maxLength: 250,
              showCounter: true,
              onFieldSubmitted: (v){TextInputAction.done;},
            ),

          ],
        ),
      ),
    );
  }

}
