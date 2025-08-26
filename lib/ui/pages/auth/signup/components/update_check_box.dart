import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class UpdatesCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const UpdatesCheckbox({
    super.key,
    this.initialValue = false,
    this.onChanged,
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
    widget.onChanged?.call(_value); // still notify parent if needed
  }

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1,
              child: Checkbox(
                value: _value,
                onChanged: _toggle,
                activeColor: const Color(0xFF667eea),
                side: const BorderSide(color: Colors.white70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _toggle(!_value),
                child:  Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    'Send me important updates & promotions via SMS, email, and WhatsApp',
                      style: context.textTheme.displaySmall?.copyWith(color: Colors.white)

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
