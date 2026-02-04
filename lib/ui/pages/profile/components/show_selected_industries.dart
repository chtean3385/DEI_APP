import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:dei_champions/models/profile/employee_user_model/employee_user_model.dart'
as IndustryModel2;

class ShowSelectedDepartmentIndustries extends StatelessWidget {
  final List<IndustryModel2.DepartmentModel> selectedIndustries;
  final Function(IndustryModel2.DepartmentModel) onRemove;
  final GlobalKey<FormState>? formKey;
  final bool showRemoveOption;
  final Color? borderColor;
  final String? label;

  const ShowSelectedDepartmentIndustries({
    Key? key,
    required this.selectedIndustries,
    required this.onRemove,
    this.formKey,
    this.showRemoveOption = true,
    this.borderColor,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;

    if (selectedIndustries.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),
          ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: selectedIndustries.map((skill) {
            return GestureDetector(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 1,
                    color:  borderColor ?? const Color(0xFF4285F4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          skill.name ?? "",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: context.textTheme.displaySmall?.copyWith(
                            color: colorTheme.themBasedBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if(showRemoveOption)   const SizedBox(width: 4),
                      if(showRemoveOption)      GestureDetector(
                        onTap: () {
                          onRemove(skill);
                        },
                        child:  Icon(
                          Icons.close,
                          size: 16,
                          color: colorTheme.themBasedBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
class ShowSelectedCategories extends StatelessWidget {
  final List<IndustryModel2.IndustryModel> selectedIndustries;
  final Function(IndustryModel2.IndustryModel) onRemove;
  final GlobalKey<FormState>? formKey;
  final bool showRemoveOption;
  final Color? borderColor;
  final String? label;

  const ShowSelectedCategories({
    Key? key,
    required this.selectedIndustries,
    required this.onRemove,
    this.formKey,
    this.showRemoveOption = true,
    this.borderColor,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;

    if (selectedIndustries.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: colorTheme.black54,
              ),
            ),
          ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: selectedIndustries.map((skill) {
            return GestureDetector(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 1,
                    color:  borderColor ?? const Color(0xFF4285F4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          skill.title ?? "",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: context.textTheme.displaySmall?.copyWith(
                            color: colorTheme.themBasedBlack,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if(showRemoveOption)   const SizedBox(width: 4),
                      if(showRemoveOption)      GestureDetector(
                        onTap: () {
                          onRemove(skill);
                        },
                        child:  Icon(
                          Icons.close,
                          size: 16,
                          color: colorTheme.themBasedBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
