import 'package:flutter/material.dart';
import '../../../../../../widgets/pickers/custom_chip.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';

class SpecializationSelector extends StatefulWidget {
  final List<String> specializations;
  final String? selectedSpecialization;
  final Function(String) onChanged;
  final int initiallyVisible;
  final GlobalKey<FormState>? formKey;

  const SpecializationSelector({
    Key? key,
    required this.specializations,
    this.selectedSpecialization,
    required this.onChanged,
    this.initiallyVisible = 5, // you can set initial visible count
    this.formKey,
  }) : super(key: key);

  @override
  State<SpecializationSelector> createState() => _SpecializationSelectorState();
}

class _SpecializationSelectorState extends State<SpecializationSelector> {
  bool _expanded = false;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedSpecialization;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FormField<String>(
      validator: (_) {
        if (_selectedValue == null || _selectedValue!.isEmpty) {
          return "Please select a specialization";
        }
        return null;
      },
      builder: (field) {
        // ✅ If selected → show only that one
        if (_selectedValue != null && _selectedValue!.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Specialization*",
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CustomChip(
                isSelected: true,
                option: _selectedValue!,
                showRemove: true,
                onChanged: (_) {
                  setState(() {
                    _selectedValue = null;
                    _expanded = false;
                  });
                  widget.onChanged("");
                  field.didChange(null);
                  field.validate();
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
          );
        }

        // ✅ If none selected → show initial list (collapsed or expanded)
        final visibleSpecializations = _expanded
            ? widget.specializations
            : widget.specializations.take(widget.initiallyVisible).toList();

        final hiddenCount = widget.specializations.length - widget.initiallyVisible;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Specialization*",
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...visibleSpecializations.map((spec) {
                  return CustomChip(
                    isSelected: false,
                    option: spec,
                    showRemove: false,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                      widget.onChanged(value);
                      field.didChange(value);
                      field.validate();
                    },
                  );
                }),
                if (!_expanded && hiddenCount > 0)
                  CustomChip(
                    isSelected: false,
                    option: "+$hiddenCount More",
                    onChanged: (_) {
                      setState(() {
                        _expanded = true;
                      });
                    },
                    showRemove: false,
                    onRemove: (_) {},
                  ),
              ],
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
        );
      },
    );
  }
}
