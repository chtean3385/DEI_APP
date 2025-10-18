import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/app_styles.dart';
import '../../../../../constants/enums.dart';
import '../../../../../providers/providers.dart';


class EmployerApplicationFilterOptions extends ConsumerWidget {
  const EmployerApplicationFilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employerApplicationsProvider);
    final controller = ref.read(employerApplicationsProvider.notifier);
    final categories = [
      "All",          // Show everything
      "New",          // Newly applied
      "Reviewed",     // Reviewed applications
      "Interview",    // Selected for interview
      "Rejected",     // Rejected applications
      "Hired",        // Accepted / Hired
    ];


    if (state.pageState == PageState.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return    Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Applicants (2)', style: context.textTheme.titleMedium),
        ),
        gapH8(),
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, i) {
              final option = categories[i];
              final isSelected = state.selectedFilter == option;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // tighter
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // remove min size
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8), // reduce label gap
                  padding: EdgeInsets.zero, // remove extra space
                  label: Text(option),
                  selected: isSelected,
                  onSelected: (_) => controller.selectFilter(option),
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
        ),
      ],
    );
  }
}
