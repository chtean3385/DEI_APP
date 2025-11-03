import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_drop_down.dart';
import '../../auth/signup/widgets/education/year_selector.dart';
import 'edit_profile_action_button.dart';

class EditEducationInformation extends ConsumerWidget {
  final bool isFromCommonEdit;

  const EditEducationInformation({super.key, this.isFromCommonEdit = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editEmployeeProfileProvider.notifier);
    final state = ref.watch(editEmployeeProfileProvider);

    return Card(
      elevation: 2,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: isFromCommonEdit != true,
        // collapsed by default
        title: Text(
          "Education",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,

        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        trailing: isFromCommonEdit ? null : const SizedBox.shrink(),
        onExpansionChanged: isFromCommonEdit ? null : (_) {},
        childrenPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        children: [
          ...state.educationEntries!.asMap().entries.map((entry) {
            final index = entry.key;
            final edu = entry.value;
            return _item(
              edu.degreeController,
              edu.institutionController,
              edu.graduationYearController,
              () => controller.removeEducationEntry(index),
              state.degrees?.map((e) => e.name).toList() ?? [],
              state.institutes?.map((e) => e.name).toList() ?? [],
            );
          }).toList(),
          gapH16(),
          CustomThemeButton(
            isExpanded: false,
            color: AppColors.primaryColor,
            radius: 8,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: Colors.white, size: 20),
                Text(
                  "Add Education",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onTap: () => controller.addEducationEntry(),
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
    );
  }

  Widget _item(
    TextEditingController ctr1,
    TextEditingController ctr2,
    TextEditingController ctr3,
    VoidCallback onRemove,
    List<String> degreeList,
    List<String> instituteList,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 2,
        color: AppColors.bg,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TransparentDropdownField(
                isRequired: true,
                label: "Degree",
                hint: "Select your degree",
                icon: Icons.school_outlined,
                items: degreeList,
                value: ctr1.text,
                validator: AppValidators.fieldEmpty("Degree"),
                onChanged: (value) {
                  ctr1.text = value ?? "";
                },
              ),
              gapH16(),
              TransparentDropdownField(
                isRequired: true,
                label: "Institution",
                hint: "Select your institution",
                icon: Icons.account_balance_outlined,
                items: instituteList,
                value: ctr2.text,
                validator: AppValidators.fieldEmpty("Institution"),
                onChanged: (value) {
                  ctr2.text = value ?? "";
                },
              ),

              gapH16(),

              YearSelector(
                title: "Graduation Year",
                selectedYear: ctr3.text,
                onChanged: (year) {
                  ctr3.text = year;
                  print("Selected Graduation Year: $year");
                },
              ),
              gapH16(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_forever, color: Colors.red),
                  label: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EducationEntryControllers {
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController institutionController = TextEditingController();
  final TextEditingController graduationYearController =
      TextEditingController();

  void dispose() {
    degreeController.dispose();
    institutionController.dispose();
    graduationYearController.dispose();
  }
}
