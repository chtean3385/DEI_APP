// ---------------------------- Salary insights ----------------------------
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/custom_decorated_box.dart';
import 'package:flutter/material.dart';

class SalaryInsightsCard extends StatefulWidget {
  const SalaryInsightsCard({Key? key}) : super(key: key);

  @override
  State<SalaryInsightsCard> createState() => _SalaryInsightsCardState();
}

class _SalaryInsightsCardState extends State<SalaryInsightsCard> {
  double _value = 3.3; // represent average salary in LPA

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Salary insights', style: theme.titleMedium),
        gapH16(),
        CustomDecoratedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Compare salaries of fresher with similar companies.',
                style: theme.bodyMedium?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Avg. Salary - \u20B9 ${3.3.toStringAsFixed(1)}L',
                  style: theme.labelMedium,
                ),
              ),
              Slider(
                value: _value,
                min: 1.9,
                max: 5.4,
                divisions: ((5.4 - 1.9) * 10).toInt(),
                onChanged: (v) => setState(() => _value = v),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Min \u20B91.9 LPA', style: theme.bodyMedium),
                  Text('Max \u20B95.4 LPA', style: theme.bodyMedium),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
