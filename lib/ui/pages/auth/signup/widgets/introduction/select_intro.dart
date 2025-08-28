import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/pickers/custom_chip.dart';
import 'package:flutter/material.dart';

class SelectIntro extends StatefulWidget {
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
  State<SelectIntro> createState() => _SelectIntroState();
}

class _SelectIntroState extends State<SelectIntro> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<List<String>>(
      validator: (_) {
        if (widget.introList.isEmpty) {
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
              if (widget.introList.isNotEmpty)
                Text(
                  'Or select from below',
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (widget.introList.isNotEmpty) const SizedBox(height: 16),

              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.introList.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final title = widget.introList[index];
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primaryColor.withValues(alpha: 0.2),
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
                                color: Colors.black,
                                fontSize: 13,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          CustomChip(
                            option: "Select",
                            showRemove: false,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                              // widget.onChanged(value);
                              // field.didChange(value);
                              // field.validate();
                            },
                            isSelected: false,
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
