import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';

class AppliedFilterOptions extends ConsumerWidget {
  const AppliedFilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeAppliedJobsProvider);
    final controller = ref.read(employeeAppliedJobsProvider.notifier);

    final categories = ["All", "Pending", "Accepted", "Interviewing","Negotiation","Hired","Rejected",];
    return    SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, i) {
          final option = categories[i];
          final isSelected = (state.status??"All") == option;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // tighter
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // remove min size
              labelPadding: const EdgeInsets.symmetric(horizontal: 8), // reduce label gap
              padding: EdgeInsets.zero, // remove extra space
              label: Text(option),
              selected: isSelected,
              onSelected: (_) => controller.fetchJobs(status: option),
              selectedColor: AppColors.primaryColor,
              labelStyle: context.textTheme.bodyMedium?.copyWith(color:isSelected ? Colors.white :AppColors.primaryColor ),
              backgroundColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: AppColors.primaryColor),
              ),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }
}
