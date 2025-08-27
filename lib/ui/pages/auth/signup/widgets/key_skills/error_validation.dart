import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

class ErrorValidation extends StatelessWidget {
  final String? input;
  final String? errorMessage;
  final GlobalKey<FormState> formKey;

  const ErrorValidation({
    super.key,
    this.input,
    required this.formKey,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    print("inputinput -$input");
    return FormField<bool>(
      validator: (value) {
        if (input == null || input?.isEmpty == true) {
          return errorMessage ?? 'Please fill';
        }
        return null;
      },
      builder: (field) {
        if (field.hasError) {
          return Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              field.errorText!,
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.redAccent,
                fontWeight: FontWeight.normal,
                fontSize: 10,
              ),
            ),
          );
        }
        // ✅ Always return a widget
        return const SizedBox.shrink();
      },
    );
  }
}
