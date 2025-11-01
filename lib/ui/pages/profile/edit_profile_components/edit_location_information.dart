import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparent_form_field.dart';

class EditLocationInformation extends ConsumerWidget {
  const EditLocationInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        initiallyExpanded: false, // collapsed by default
        title: Text(
          "Location Information",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          TransparentFormField(
            isRequired: true,
            controller: controller.addressController,
            hint: "Enter Address",
            label: "Address",
            icon: Icons.home_outlined,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("Address"),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),

          // City Field
          TransparentFormField(
            isRequired: true,
            controller: controller.cityController,
            hint: "Enter City",
            label: "City",
            icon: Icons.location_city_outlined,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("City"),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),
          TransparentFormField(
            isRequired: true,
            controller: controller.stateController,
            label: "State",
            hint: "Select State",
            icon: Icons.map_outlined,
            textInputAction: TextInputAction.next,
            validator: AppValidators.fieldEmpty("State"),
            textCapitalization: TextCapitalization.words,
          ),
          gapH16(),
          TransparentFormField(
            controller: controller.countryController,
            label: "Country",
            hint: "Select Country",
            icon: Icons.public_outlined,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
          ),

          gapH16(),
          TransparentFormField(
            isRequired: true,
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
