import 'package:flutter/material.dart';

import '../../../../../../widgets/pickers/option_selector.dart';

class NoticePeriodWidget extends StatelessWidget {
  final String selectedPeriod;
  final Function(String) onChanged;
  final FocusNode focusNode;

  const NoticePeriodWidget({
    Key? key,
    required this.selectedPeriod,
    required this.onChanged, required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final periods = [
      '15 Days or less',
      '1 Month',
      '2 Months',
      '3 Months',
      'More than 3 Months',
      'Serving Notice Period',
    ];

    return OptionSelector(
      title: "Notice period*",
      options:periods,
      selectedValue: selectedPeriod,
      onChanged: onChanged,
    );
  }
}
