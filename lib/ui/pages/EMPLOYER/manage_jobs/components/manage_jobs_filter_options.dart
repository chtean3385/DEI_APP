import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../constants/enums.dart';
import '../../../../../providers/providers.dart';
import '../../../../../widgets/others/shimmer_loader.dart';
import '../../../search/components/search_job_card.dart';

class EmployerManageJobsFilterOptions extends ConsumerStatefulWidget {
  final Map<String, dynamic>? params;

  const EmployerManageJobsFilterOptions({this.params, super.key});

  @override
  ConsumerState<EmployerManageJobsFilterOptions> createState() =>
      _EmployerManageJobsFilterOptionsState();
}

class _EmployerManageJobsFilterOptionsState
    extends ConsumerState<EmployerManageJobsFilterOptions> {
  // ✅ Map API keys to display labels
  final Map<String, String> keyToLabelMap = {
    "totalJobs": "All",
    "open": "Open",
    "closed": "Closed",
    "draft": "Drafts",
  };

  // ✅ Helper to get API key from label
  String getKeyFromLabel(String label) {
    return keyToLabelMap.entries
        .firstWhere(
          (e) => e.value == label,
          orElse: () => const MapEntry("totalJobs", "All"),
        )
        .key;
  }

  // ✅ Get label list for display chips
  late final List<String> categories = keyToLabelMap.values.toList();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(employerManageJobsProvider.notifier);

      // ✅ Read status key from params if provided
      final apiKey = widget.params?['status']?.toString() ?? "totalJobs";
      final initialLabel = keyToLabelMap[apiKey] ?? "All";

      // controller.resetState();
      controller.selectFilter(apiKey);
      // controller.fetchJobs(apiKey);

      _scrollToSelected(initialLabel);
    });
  }

  void _scrollToSelected(String label) {
    final index = categories.indexOf(label);
    if (index == -1 || !_scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      const chipWidth = 100.0;
      final offset = (index * chipWidth) - (screenWidth / 2) + (chipWidth / 2);

      _scrollController.animateTo(
        offset.clamp(0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employerManageJobsProvider);
    final controller = ref.read(employerManageJobsProvider.notifier);

    final currentApiKey = state.status ?? "totalJobs";
    final currentLabel = keyToLabelMap[currentApiKey] ?? "All";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, i) {
              final label = categories[i];
              final isSelected = currentLabel == label;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.zero,

                  label: Text(label),
                  selected: isSelected,
                  onSelected: (_) {
                    final apiKey = getKeyFromLabel(label);
                    controller.selectFilter(apiKey);
                    _scrollToSelected(label);
                  },
                  selectedColor: AppColors.primaryColor,
                  labelStyle: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? Colors.white : AppColors.primaryColor,
                  ),
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
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 12,
            left: 16,
            right: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Easily manage and track all your job postings by status",
                  style: context.textTheme.displaySmall?.copyWith(fontSize: 10),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              const SizedBox(width: 8),
              state.pageState == PageState.loading
                  ? const ShimmerLoader(
                      child: ShimmerBox(height: 12, width: 60, radius: 4),
                    )
                  : Text(
                      "${state.data?.length ?? 0} Jobs",
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
