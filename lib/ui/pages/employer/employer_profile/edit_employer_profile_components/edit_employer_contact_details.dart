import 'package:dei_champions/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_strings.dart';
import '../../../../../constants/app_styles.dart';
import '../../../../../constants/app_validators.dart';
import '../../../../../widgets/form/transparent_form_field.dart';
import '../../../auth/signup_employer/widgets/select_city.dart';
import '../../../auth/signup_employer/widgets/select_state.dart';

class EditEmployerContactInformation extends ConsumerWidget {
  const EditEmployerContactInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployerProfileProvider);
    final controller = ref.read(editEmployerProfileProvider.notifier);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
        // collapsed by default
        title: Text(
          "Contact Information",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [
          TransparentFormField(
            controller: controller.emailController,
            hint: AppStrings.email,
            label: AppStrings.email,
            icon: Icons.email_outlined,
            readOnly: true,
            fillColor: Colors.black12,
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.mobileController,
            hint: AppStrings.mobile,
            label: AppStrings.mobile,
            autofillHints: [AutofillHints.telephoneNumber],
            textInputAction: TextInputAction.next,
            icon: Icons.phone_android,
            validator: AppValidators.phone,
            keyboardType: TextInputType.phone,
            maxLength: 10,
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.addressController,
            hint: "Enter Address",
            label: "Address",
            icon: Icons.home_outlined,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("Address"),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),
          SelectState(controller: controller.stateController),
          gapH16(),
          SelectCity(controller: controller.cityController),
          gapH16(),
          TransparentFormField(
            controller: controller.pinCodeController,
            hint: "Enter Pincode",
            label: "Pincode",
            icon: Icons.pin_drop_outlined,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("Pincode"),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
        ],
      ),
    );
  }
}
