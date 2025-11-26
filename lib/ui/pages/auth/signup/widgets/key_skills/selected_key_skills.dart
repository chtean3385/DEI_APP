import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SelectedKeySkills extends StatelessWidget {
  final List<String> selectedSkill;
  final Function(String) onRemove;
  final GlobalKey<FormState>? formKey;
  final bool showRemoveOption;
  final Color? borderColor;
  final String? label;

  const SelectedKeySkills({
    Key? key,
    required this.selectedSkill,
    required this.onRemove,
    this.formKey,
    this.showRemoveOption = true,
    this.borderColor, this.label ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colors;

    return FormField<List<String>>(
      validator: (v) {
        print("vvvvvvvv$v");
        if (selectedSkill.isEmpty) {
          return "Please select at least one ${label?.toLowerCase() ?? "skill"}";
        }
        return null;
      },
      builder: (field) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectedSkill.isNotEmpty)    Text(
                'Selected ${label ?? "Skills"}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: colorTheme.black54,
                ),
              ),
              if (selectedSkill.isNotEmpty)   const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: selectedSkill.map((skill) {
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
                            Text(
                              skill,
                              style: context.textTheme.displaySmall?.copyWith(
                                color: colorTheme.themBasedBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                         if(showRemoveOption)   const SizedBox(width: 4),
                            if(showRemoveOption)      GestureDetector(
                              onTap: () {
                                onRemove(skill);
                                field.didChange(selectedSkill);
                                field.validate();
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
              if (field.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    field.errorText ?? "",
                    style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.redAccent,fontWeight:  FontWeight.normal,fontSize: 10
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
