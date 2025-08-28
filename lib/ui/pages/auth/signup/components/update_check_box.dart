import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class UpdatesCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final GlobalKey<FormState> formKey;

  const UpdatesCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
    required this.formKey,
  });

  @override
  State<UpdatesCheckbox> createState() => _UpdatesCheckboxState();
}

class _UpdatesCheckboxState extends State<UpdatesCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _toggle(bool? newValue) {
    setState(() {
      _value = newValue ?? false;
    });
    widget.onChanged?.call(_value);
    widget.formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      validator: (value) {
        if (!_value) {
          return 'Please accept updates & promotions to continue';
        }
        return null;
      },
      builder: (field) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: field.hasError
                  ? Colors.redAccent
                  :AppColors.primaryColor.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1,
                      child: Checkbox(
                        value: _value,
                        onChanged: _toggle,
                        visualDensity: VisualDensity.compact,
                        activeColor: const Color(0xFF667eea),
                        side: const BorderSide(color: Colors.black54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _toggle(!_value),
                        child: Text(
                          'Send me important updates & promotions via SMS, email, and WhatsApp',
                          style: context.textTheme.displaySmall?.copyWith(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (field.hasError)
                  Padding(
                    padding:  EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      field.errorText!,
                      style: context.textTheme.displaySmall?.copyWith(
                          color: Colors.redAccent,fontWeight:  FontWeight.normal,
                          fontSize: 10
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
