import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/custom_theme_button.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../constants/app_colors.dart';
import '../../../../../../widgets/form/transparent_form_field.dart';
import '../../components/auto_sugstion_form_field.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

class KeyForm extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onSkillSelected;
  final FocusNode? focusNode;
  final String label;
  final String hint;

  KeyForm({
    super.key,
    required this.controller,
    this.onSkillSelected,
    this.focusNode,
    this.label = "Key Skill",
    this.hint = "Enter your key skill",
  });

  // Skills list
  final List<String> _skills = [
    'Java',
    'Python',
    'Dart',
    'Flutter',
    'React',
    'Angular',
    'Node.js',
    'C++',
    'C#',
    'Go',
    'Kotlin',
    'Swift',
    'HTML',
    'CSS',
    'JavaScript',
    'SQL',
    'MongoDB',
    'Firebase',
    'AWS',
    'Azure',
    'Google Cloud',
    'Docker',
    'Kubernetes',
    'Git',
    'Agile Methodologies',
    'UI/UX Design',
    'Figma',
    'Adobe Photoshop',
    'Excel',
    'Power BI',
    'Data Analysis',
    'Machine Learning',
    'Deep Learning',
    'NLP',
    'Cybersecurity',
    'Testing & QA',
    'API Development',
    'RESTful APIs',
    'GraphQL',
    'DevOps',
  ];

  @override
  Widget build(BuildContext context) {
    return AutoSuggestionDropdownField(
      controller: controller,
      focusNode: focusNode,
      hint: hint,
      label: label,
      icon: Icons.build_circle_outlined,
      suggestions: _skills,
      maxSuggestions: 8,
      caseSensitive: false,
      onSuggestionSelected: (suggestion) {
        onSkillSelected?.call(suggestion);
        controller.clear();
      },
    );
  }
}

class KeyFormManual extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onSkillSelected;
  final FocusNode? focusNode;
  final String label;
  final String hint;

  const KeyFormManual({
    super.key,
    required this.controller,
    this.onSkillSelected,
    this.focusNode,
    this.label = "Key Skill",
    this.hint = "Enter your key skill",
  });

  @override
  State<KeyFormManual> createState() => _KeyFormManualState();
}

class _KeyFormManualState extends State<KeyFormManual> {
  bool isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    final hasText = widget.controller.text.trim().isNotEmpty;
    if (hasText != isTextNotEmpty) {
      setState(() {
        isTextNotEmpty = hasText;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateButtonState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TransparentFormField(
          controller: widget.controller,
          hint: widget.hint,
          label: widget.label,
          icon: Icons.build_circle_outlined,
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          onFieldSubmitted: (text) {
            if (text.trim().isNotEmpty) {
              widget.onSkillSelected?.call(text.trim());
              widget.controller.clear();
            }
          },
        ),
        gapH4(),
        CustomThemeButton(
          color: isTextNotEmpty ? AppColors.primaryColor : Colors.grey,
          borderColor: isTextNotEmpty ? AppColors.primaryColor : Colors.grey,
          // height: 56,
          radius: 16,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          isExpanded: false,
          alignRight: true,
          onTap: () {
            if (isTextNotEmpty) {
              widget.onSkillSelected?.call(widget.controller.text.trim());
              widget.controller.clear();
            }
          },
          child: Text(
            "Add",
            style: context.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );

    // return Row(
    //   mainAxisSize: MainAxisSize.min,
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Expanded(
    //       child: TransparentFormField(
    //         controller: widget.controller,
    //         hint: widget.hint,
    //         label: widget.label,
    //         icon: Icons.build_circle_outlined,
    //         textInputAction: TextInputAction.next,
    //         textCapitalization: TextCapitalization.words,
    //         onFieldSubmitted: (text) {
    //           if (text.trim().isNotEmpty) {
    //             widget.onSkillSelected?.call(text.trim());
    //             widget.controller.clear();
    //           }
    //         },
    //       ),
    //     ),
    //     gapW16(),
    //     CustomThemeButton(
    //       color: isTextNotEmpty ? AppColors.primaryColor : Colors.grey,
    //       borderColor: isTextNotEmpty ? AppColors.primaryColor : Colors.grey,
    //       height: 56,
    //       radius: 16,
    //       isExpanded: false,
    //       alignRight: true,
    //       onTap: () {
    //         if (isTextNotEmpty) {
    //           widget.onSkillSelected?.call(widget.controller.text.trim());
    //           widget.controller.clear();
    //         }
    //       },
    //       child: Text(
    //         "Add",
    //         style: context.textTheme.titleMedium?.copyWith(
    //           color:  Colors.white
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

class TransparentAddFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? label;
  final IconData? icon;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLength;
  final double? radius;
  final bool readOnly;
  final bool isRequired;
  final Color? fillColor;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onSkillSelected;

  const TransparentAddFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.label,
    this.icon,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autofillHints,
    this.textInputAction,
    this.inputFormatters,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType,
    this.minLines,
    this.maxLength,
    this.radius,
    this.readOnly = false,
    this.isRequired = false,
    this.fillColor,
    this.onFieldSubmitted,
    this.onSkillSelected,
  });

  @override
  State<TransparentAddFormField> createState() =>
      _TransparentAddFormFieldState();
}

class _TransparentAddFormFieldState extends State<TransparentAddFormField> {
  bool get isTextNotEmpty => widget.controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          RichText(
            text: TextSpan(
              text: widget.label!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorTheme.themBasedBlack,
                fontWeight: FontWeight.normal,
              ),
              children: widget.isRequired
                  ? [
                      TextSpan(
                        text: ' *',
                        style:  TextStyle(
                          color: colorTheme.themBasedBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                  : [],
            ),
          ),
        if (widget.label != null) gapH4(),
        DecoratedBox(
          decoration: BoxDecoration(
            color:
                widget.fillColor ??
                    colorTheme.cardBgColor,
            borderRadius: BorderRadius.circular(widget.radius ?? 16),
            border: Border.all(
              color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.13),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    keyboardType: widget.keyboardType,
                    validator: widget.validator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textCapitalization: widget.textCapitalization,
                    autofillHints: widget.autofillHints,
                    textInputAction: widget.textInputAction,
                    inputFormatters: widget.inputFormatters,
                    cursorColor: colorTheme.themBasedBlack,
                    maxLength: widget.maxLength,
                    minLines: widget.minLines ?? 1,
                    maxLines: 1,
                    readOnly: widget.readOnly,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorTheme.themBasedBlack,
                      fontWeight: FontWeight.normal,
                    ),
                    onFieldSubmitted:
                        widget.onFieldSubmitted ??
                        (text) {
                          if (text.trim().isNotEmpty) {
                            widget.onSkillSelected?.call(text.trim());
                            widget.controller.clear();
                          } else {
                            FocusScope.of(context).unfocus();
                          }
                        },
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: colorTheme.themBasedBlack,
                      ),
                      counterText: "",
                      errorStyle: theme.textTheme.displaySmall?.copyWith(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
                      ),
                      prefixIcon: widget.icon != null
                          ? Icon(widget.icon, color: colorTheme.black54, size: 22)
                          : null,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomThemeButton(
                    color: isTextNotEmpty
                        ? colorTheme.buttonPrimaryColor
                        : colorTheme.grey,
                    borderColor: isTextNotEmpty
                        ? colorTheme.buttonPrimaryColor
                        : Colors.grey,
                    radius: 12,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    isExpanded: false,
                    alignRight: true,
                    onTap: () {
                      if (isTextNotEmpty) {
                        widget.onSkillSelected?.call(
                          widget.controller.text.trim(),
                        );
                        widget.controller.clear();
                      }
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
