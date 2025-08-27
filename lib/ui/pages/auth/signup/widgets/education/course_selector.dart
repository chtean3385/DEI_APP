import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../../widgets/pickers/custom_chip.dart';

class CourseSelector extends StatefulWidget {
  final List<String> courses;
  final String? selectedCourse;
  final Function(String) onChanged;
  final int initiallyVisible;
  final GlobalKey<FormState>? formKey;

  const CourseSelector({
    Key? key,
    required this.courses,
    this.selectedCourse,
    required this.onChanged,
    this.initiallyVisible = 2,
    this.formKey,
  }) : super(key: key);

  @override
  State<CourseSelector> createState() => _CourseSelectorState();
}

class _CourseSelectorState extends State<CourseSelector> {
  bool _expanded = false;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedCourse;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return FormField<String>(
      validator: (_) {
        if (_selectedValue == null || _selectedValue!.isEmpty) {
          return "Please select a course";
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
                "Select Course*",
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
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
                  widget.onChanged(""); // notify empty
                  field.didChange(null); // update form state
                  field.validate(); // trigger validation
                },
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
          );
        }

        // ✅ If none selected → show initial list (collapsed or expanded)
        final visibleCourses = _expanded
            ? widget.courses
            : widget.courses.take(widget.initiallyVisible).toList();

        final hiddenCount = widget.courses.length - widget.initiallyVisible;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Course*",
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...visibleCourses.map((course) {
                  return CustomChip(
                    isSelected: false,
                    option: course,
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
                      color: Colors.redAccent,fontWeight:  FontWeight.normal,fontSize: 10
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
