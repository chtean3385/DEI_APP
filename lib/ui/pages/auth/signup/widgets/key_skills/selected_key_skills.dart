import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SelectedKeySkills extends StatelessWidget {
  final List<String> selectedSkill;
  final Function(String) onRemove;
  final GlobalKey<FormState>? formKey;

  const SelectedKeySkills({
    Key? key,
    required this.selectedSkill,
    required this.onRemove,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      validator: (_) {
        if (selectedSkill.isEmpty) {
          return "Please select at least one skill";
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
                'Selected Skills',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
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
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF4285F4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              skill,
                              style: context.textTheme.displaySmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                onRemove(skill);
                                field.didChange(selectedSkill);
                                field.validate();
                              },
                              child: const Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.white,
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
