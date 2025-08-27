import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;

import '../../../../../../constants/app_validators.dart';
import '../../../../../../widgets/form/transparent_form_field.dart';

class SalaryWidget extends StatelessWidget {
  final TextEditingController controller;

  const SalaryWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current annual salary*',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TransparentFormField(
                controller: controller,
                hint: 'Eg. 4,50,000',
                icon: Icons.currency_rupee,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: AppValidators.fieldEmpty("Current annual salary"),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Per year',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Recruiters need this information before selecting candidates for jobs',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}