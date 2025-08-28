import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class SelectIntro extends StatelessWidget {
  final List<String> introList;
  final Function(String) onRemove;
  final GlobalKey<FormState>? formKey;

  const SelectIntro({
    Key? key,
    required this.introList,
    required this.onRemove,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      validator: (_) {
        if (introList.isEmpty) {
          return "Please select at least one skill";
        }
        return null;
      },
      builder: (field) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (introList.isNotEmpty)
                Text(
                  'Or select from below',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (introList.isNotEmpty) const SizedBox(height: 16),

              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: introList.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final title = introList[index];
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
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
                                child: Text(
                                  "Select",
                                  style: context.textTheme.displaySmall
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (field.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    field.errorText ?? "",
                    style: context.textTheme.displaySmall?.copyWith(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
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
