import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/app_validators.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/form/transparant_date_picker.dart';
import '../../../../widgets/form/transparent_form_field.dart';

class EditWorkExpInformation extends ConsumerWidget {
  const EditWorkExpInformation({super.key});

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
        title: Text(
          "Work Experience",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        visualDensity: VisualDensity.compact,
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        children: [
          ...state.workExpEntries!.asMap().entries.map((entry) {
            final index = entry.key;
            final workExp = entry.value;
            return _item(
              workExp.companyController,
              workExp.positionController,
              workExp.startDateController,
              workExp.endDateController,
              workExp.descriptionController,
                  () => controller.removeWorkExpEntry(index),
            );
          }).toList(),
          gapH16(),
          CustomThemeButton(
            isExpanded: false,
            color: AppColors.primaryColor,
            radius: 8,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: Colors.white, size: 20),
                const SizedBox(width: 4),
                Text(
                  "Add Experience",
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onTap: () => controller.addWorkExpEntry(),
          ),
          gapH16(),
        ],
      ),
    );
  }

  Widget _item(
      TextEditingController companyCtr,
      TextEditingController positionCtr,
      TextEditingController startCtr,
      TextEditingController endCtr,
      TextEditingController descCtr,
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
                controller: companyCtr,
                hint: "Enter company name",
                label: "Company",
                icon: Icons.business_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Company"),
                textCapitalization: TextCapitalization.words,
              ),
              gapH16(),
              TransparentFormField(
                controller: positionCtr,
                hint: "Enter position",
                label: "Position",
                icon: Icons.badge_outlined,
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Position"),
                textCapitalization: TextCapitalization.words,
              ),
              gapH16(),
              TransparentDatePickerField(
                hint: "Start Date",
                label: "Start Date",
                icon: Icons.calendar_today_outlined,
                controller: startCtr,
                initialDate: DateTime.now(),
                validator: AppValidators.fieldEmpty("Start Date"),
              ),
              gapH16(),
              TransparentDatePickerField(
                hint: "End Date",
                label: "End Date",
                icon: Icons.calendar_today_outlined,
                controller: endCtr,
                initialDate: DateTime.now(),
                validator: AppValidators.fieldEmpty("End Date"),
              ),

              gapH16(),
              TransparentFormField(
                controller: descCtr,
                hint: "short description",
                label: "Description",
                textInputAction: TextInputAction.next,
                validator: AppValidators.fieldEmpty("Description"),
                textCapitalization: TextCapitalization.words,
                minLines: 3,
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

class WorkExperienceEntryControllers {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void dispose() {
    companyController.dispose();
    positionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    descriptionController.dispose();
  }
}
