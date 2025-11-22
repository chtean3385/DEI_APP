import 'package:dei_champions/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import '../../../../../../widgets/pickers/custom_chip.dart';

/// Generate a list of years from current year to (current year - 50)
List<String> generateYearList({int yearsBack = 50}) {
  final currentYear = DateTime.now().year;
  return List.generate(
    yearsBack + 1,
        (index) => (currentYear - index).toString(),
  );
}

class YearSelector extends StatefulWidget {
  final String title;
  final String? selectedYear;
  final Function(String) onChanged;
  final int initiallyVisible;
  final GlobalKey<FormState>? formKey;

  const YearSelector({
    Key? key,
    required this.title,
    this.selectedYear,
    required this.onChanged,
    this.initiallyVisible = 5,
    this.formKey,
  }) : super(key: key);

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  bool _expanded = false;
  String? _selectedValue;
  late List<String> _years;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedYear;
    _years = generateYearList();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = context.colors;

    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: FormField<String>(
        validator: (_) {
          if (_selectedValue == null || _selectedValue!.isEmpty) {
            return "Please select ${widget.title.toLowerCase()}";
          }
          return null;
        },
        builder: (field) {
          if (_selectedValue != null && _selectedValue!.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.title}*",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorTheme.themBasedBlack,
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

          final visibleYears =
          _expanded ? _years : _years.take(widget.initiallyVisible).toList();
          final hiddenCount = _years.length - widget.initiallyVisible;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.title}*",
                style: textTheme.bodyMedium?.copyWith(
                  color: colorTheme.themBasedBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...visibleYears.map((year) => CustomChip(
                    isSelected: false,
                    option: year,
                    showRemove: false,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                      widget.onChanged(value);
                      field.didChange(value);
                      field.validate();
                    },
                  )),
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
      ),
    );
  }
}
