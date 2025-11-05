import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../auth/signup_employer/widgets/select_city.dart';
import '../../auth/signup_employer/widgets/select_state.dart';

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
      clipBehavior: Clip.antiAlias,
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
          TransparentDropdownField(
            isRequired: true,
            hint: "Select your city",
            label: "City",
            icon: Icons.location_city_outlined,
            items: state.cities?.map((e)=>e.name).toList() ?? [],
            value: controller.cityController.text,
            validator: AppValidators.fieldEmpty("City"),
            onChanged: (value) {
              controller.cityController.text = value ?? "";
            },
          ),
          gapH16(),
          TransparentDropdownField(
            isRequired: true,
            hint: "Select your state",
            label: "State",
            icon: Icons.map_outlined,
            items: state.states?.map((e)=>e.name).toList() ?? [],
            value: controller.stateController.text,
            validator: AppValidators.fieldEmpty("State"),
            onChanged: (value) {
              controller.stateController.text = value ?? "";
            },
          ),

          gapH16(),
          TransparentDropdownField(
            isRequired: true,
            hint: "Select your country",
            label: "Country",
            icon: Icons.public_outlined,
            items: state.countries?.map((e)=>e.name).toList() ?? [],
            value: controller.countryController.text,
            validator: AppValidators.fieldEmpty("Country"),
            onChanged: (value) {
              controller.countryController.text = value ?? "";
            },
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
