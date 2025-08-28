import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/app_validators.dart' show AppValidators;
import '../../../../../../widgets/form/transparent_form_field.dart';

class ExperienceWidget extends StatelessWidget {
  final TextEditingController yearsController;
  final TextEditingController monthsController;
  final FocusNode? focusNode1;
  final FocusNode? focusNode2;
  final FocusNode? nextFocus;

  const ExperienceWidget({
    Key? key,
    required this.yearsController,
    required this.monthsController,
    this.focusNode1, this.focusNode2, this.nextFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total work experience*',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TransparentFormField(
                controller: yearsController,
                focusNode: focusNode1,
                hint: "Years",
                icon: Icons.calendar_today_rounded,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: AppValidators.fieldEmpty("Years"),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TransparentFormField(
                controller: monthsController,
                focusNode: focusNode2,
                hint: "Months",
                icon: Icons.calendar_month,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: AppValidators.fieldEmpty("Months"),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(nextFocus);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

