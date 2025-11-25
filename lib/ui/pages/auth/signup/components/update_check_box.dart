import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatesCheckbox extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const UpdatesCheckbox({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = context.colors;
    final bool  value =
         (ref.watch(registerProvider).acceptTerms ?? false);

    return FormField<bool>(
      validator: (fieldValue) {
        if (!(fieldValue ?? false)) {
          return 'Please accept updates & promotions to continue';
        }
        return null;
      },
      builder: (field) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: colorTheme.buttonPrimaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: field.hasError
                  ? Colors.redAccent
                  : colorTheme.buttonPrimaryColor.withValues(alpha: 0.2),
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
                        value: value,
                        onChanged: (newValue) {
                          field.didChange(newValue ?? false);
                          ref.read(registerProvider.notifier)
                              .setAcceptTerms(newValue ?? false);
                          formKey.currentState?.validate();
                        },
                        visualDensity: VisualDensity.compact,
                        activeColor: colorTheme.buttonPrimaryColor,
                        side:  BorderSide(color: colorTheme.black54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(registerProvider.notifier)
                              .toggleAcceptTerms();
                          field.didChange(!value);
                          formKey.currentState?.validate();
                        },
                        child: Text(
                          'Send me important updates & promotions via SMS, email, and WhatsApp',
                          style: context.textTheme.displaySmall?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (field.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      field.errorText!,
                      style: context.textTheme.displaySmall?.copyWith(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 10,
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
