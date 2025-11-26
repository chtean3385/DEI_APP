import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../auth/common/select_city.dart';
import 'edit_profile_action_button.dart';

class EditLocationInformation extends ConsumerWidget {
  final bool isFromCommonEdit;
  const EditLocationInformation({super.key,this.isFromCommonEdit = true});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editEmployeeProfileProvider);
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final colorTheme = context.colors;
    final hasError = controller.sectionErrors.containsKey("location");

print("State.filteredCitiestate.filteredCities-->> ${state.filteredCities?.length}");

    return Card(
      elevation: 2,
      color: colorTheme.jobCardBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(
        color: hasError ? Colors.red : colorTheme.themBasedWhite,
        width:  1,
      )),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ExpansionTile(
            initiallyExpanded: isFromCommonEdit != true,
            title: Text(
              "Location Information",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorTheme.black87,
              ),
            ),
            visualDensity: VisualDensity.compact,
            maintainState: true,
            iconColor: colorTheme.black54,
            collapsedIconColor: colorTheme.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide.none),
            trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
            onExpansionChanged: isFromCommonEdit ? null : (_) {},
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
         children: [
           Form(
             key: controller.locationFormKey,
             child: Column(
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
                 TransparentFormField(
                   controller: controller.countryController,
                   hint: "Select your country",
                   label: "Country",
                   icon: Icons.public_outlined,
                   readOnly: true,
                   fillColor: colorTheme.commonBg2Color,
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
                     if (value != null && value.isNotEmpty) {
                       controller.updateSelectedState(value); // call function
                     }
                   },

                 ),
                 gapH16(),
                 TransparentDropdownField(
                   key: ValueKey(controller.stateController.text), // ✅ ADD THIS - forces rebuild when state changes
                   isRequired: true,
                   fillColor: controller.stateController.text.isEmpty ||
                       (state.filteredCities?.isEmpty ?? true)
                       ? colorTheme.commonBg2Color
                       : null,
                   hint: AppStrings.selectCity,
                   label: AppStrings.employerCity,
                   icon: Icons.location_city_outlined,
                   items: state.filteredCities?.map((e) => e.name).toList() ?? [],
                   value: (state.filteredCities?.any((e) => e.name == controller.cityController.text) == true)
                       ? controller.cityController.text
                       : null, // ✅ This is correct
                   validator: AppValidators.fieldEmpty("city"),
                   onChanged: (value) {
                     if (value != null && value.isNotEmpty) {
                       controller.cityController.text = value;
                     }
                   },
                 ),
                 // SelectCity(
                 //   controller: controller.cityController,
                 //   cityList: state.filteredCities?.map((e)=>e.name).toList() ?? [],
                 //   readOnly: controller.stateController.text.isEmpty || (state.filteredCities?.isEmpty ?? true),
                 // ),
                 // TransparentDropdownField(
                 //   isRequired: true,
                 //   hint: "Select your city",
                 //   label: "City",
                 //   icon: Icons.location_city_outlined,
                 //   items: state.cities?.map((e)=>e.name).toList() ?? [],
                 //   value: controller.cityController.text,
                 //   validator: AppValidators.fieldEmpty("City"),
                 //   onChanged: (value) {
                 //     controller.cityController.text = value ?? "";
                 //   },
                 // ),


                 // gapH16(),
                 // TransparentDropdownField(
                 //   isRequired: true,
                 //   hint: "Select your country",
                 //   label: "Country",
                 //   icon: Icons.public_outlined,
                 //   items: state.countries?.map((e)=>e.name).toList() ?? [],
                 //   value: controller.countryController.text,
                 //   validator: AppValidators.fieldEmpty("Country"),
                 //   onChanged: (value) {
                 //     controller.countryController.text = value ?? "";
                 //   },
                 // ),


                 gapH16(),
                 TransparentFormField(
                   isRequired: true,
                   controller: controller.pinCodeController,
                   hint: "Enter Pincode",
                   label: "Pincode",
                   icon: Icons.pin_drop_outlined,
                   maxLength: 6,
                   textInputAction: TextInputAction.next,
                   validator: AppValidators.fieldEmpty("Pincode"),
                   keyboardType: TextInputType.number,
                   // maxLength: 6,
                 ),
                 gapH16(),
                 if (isFromCommonEdit != true)
                   Padding(
                     padding: const EdgeInsets.only(top: 20),
                     child: EditProfileActionButtons(
                       isEmployee: true,
                       isFromCommonEdit: isFromCommonEdit,
                     ),
                   ),
               ],

             ),
           )
         ],
          ),
          if (hasError) Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              controller.sectionErrors["location"] ?? '',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
