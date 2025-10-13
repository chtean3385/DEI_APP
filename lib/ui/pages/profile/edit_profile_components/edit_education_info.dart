import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparent_form_field.dart';
import '../../auth/signup/widgets/education/year_selector.dart';

class EditEducationInformation extends ConsumerWidget {
  const EditEducationInformation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(editProfileProvider.notifier);
    final state = ref.watch(editProfileProvider);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        initiallyExpanded: false,
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
        ],
      ),
    );
  }

  Widget _item(
    TextEditingController ctr1,
    TextEditingController ctr2,
    TextEditingController ctr3,
    VoidCallback onRemove,
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
              TransparentFormField(
                controller: ctr1,
                hint: "Enter your degree",
                label: "Degree",
                icon: Icons.school_outlined,
                // 🎓 suitable icon for degree
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Degree"),
                textCapitalization: TextCapitalization.words,
              ),
              gapH16(),

              TransparentFormField(
                controller: ctr2,
                hint: "Enter your institution name",
                label: "Institution",
                icon: Icons.account_balance_outlined,
                // 🏫 suitable icon for institution
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Institution"),
                textCapitalization: TextCapitalization.words,
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
