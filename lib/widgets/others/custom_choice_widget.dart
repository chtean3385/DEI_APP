import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class SingleChoiceSelector extends StatefulWidget {
  final String? title;
  final List<String> choices;
  final void Function(String selected) onSelected;
  final double? paddingAllValue;
  final bool isWithoutBorder;
  final String? initialValue;
  final GlobalKey<FormState>? formKey;

  const SingleChoiceSelector({
    super.key,
    this.title,
    this.paddingAllValue,
    this.isWithoutBorder = false,
    required this.choices,
    required this.onSelected,
    this.initialValue, this.formKey,
  });

  @override
  State<SingleChoiceSelector> createState() => _SingleChoiceSelectorState();
}

class _SingleChoiceSelectorState extends State<SingleChoiceSelector> {
  String? selectedChoice;

  @override
  void initState() {
    super.initState();
    // ✅ If initial value exists in the list, set it
    if (widget.initialValue != null &&
        widget.choices.contains(widget.initialValue)) {
      selectedChoice = widget.initialValue;
    }
    print("selectedChoice - $selectedChoice");
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: (_) {
          if (selectedChoice == null) return "Please select one category";
          return null;
        },
        builder: (field) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: widget.isWithoutBorder ? null  : Border.all(
              color: field.hasError ? Colors.red : Colors.grey,width: 1
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(widget.paddingAllValue ?? 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.title!,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                if (widget.title != null) const SizedBox(height: 12),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    children: widget.choices.map((choice) {
                      final isSelected = choice == selectedChoice;
                      return ChoiceChip(
                        label: Text(
                          choice,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.primaryColor,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          // 👈 Rounded corners
                          side: BorderSide(
                            color: isSelected ? Colors.white : Colors.white,
                            // 👈 Border color
                            width: 1.5,
                          ),
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedChoice = choice;
                          });
                          widget.onSelected(choice);
                          field.didChange(selectedChoice); // update FormField
                          field.validate(); // trigger validation
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
