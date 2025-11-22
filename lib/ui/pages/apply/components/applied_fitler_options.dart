import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';

class AppliedFilterOptions extends ConsumerStatefulWidget {
  final Map<String, dynamic>? params;

  const AppliedFilterOptions(this.params, {super.key});

  @override
  ConsumerState<AppliedFilterOptions> createState() =>
      _AppliedFilterOptionsState();
}

class _AppliedFilterOptionsState extends ConsumerState<AppliedFilterOptions> {
  // ✅ Map API keys to display labels
  final Map<String, String> keyToLabelMap = {
    "allApplications": "All",
    "pending": "Pending",
    "accepted": "Accepted",
    "interviewing": "Interviewing",
    "negotiation": "Negotiation",
    "hired": "Hired",
    "rejected": "Rejected",
  };

  // ✅ Reverse map to get API key from label
  String getKeyFromLabel(String label) {
    return keyToLabelMap.entries
        .firstWhere(
          (e) => e.value == label,
          orElse: () => const MapEntry("allApplications", "All"),
        )
        .key;
  }

  // ✅ List of display labels (used for chips)
  late final List<String> categories = keyToLabelMap.values.toList();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(employeeAppliedJobsProvider.notifier);

      // ✅ Get the API key from params
      final apiKey = widget.params?['status']?.toString() ?? "allApplications";
      final initialLabel =
          keyToLabelMap[apiKey] ?? "All"; // map to display label
      controller.resetState();
      // ✅ Fetch using API key
      controller.fetchJobs(status: apiKey);

      _scrollToSelected(initialLabel);
    });
  }

  void _scrollToSelected(String label) {
    final index = categories.indexOf(label);
    if (index == -1 || !_scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenWidth = MediaQuery.of(context).size.width;
      const chipWidth = 90.0; // approximate width per chip
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
    final state = ref.watch(employeeAppliedJobsProvider);
    final controller = ref.read(employeeAppliedJobsProvider.notifier);
    final colorTheme = context.colors;

    final currentApiKey = state.status ?? "allApplications";
    final currentLabel = keyToLabelMap[currentApiKey] ?? "All";

    return Column(
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
                    controller.fetchJobs(status: apiKey); // ✅ use API key
                    _scrollToSelected(label);
                  },
                  selectedColor: colorTheme.buttonPrimaryColor,
                  labelStyle: context.textTheme.bodyMedium?.copyWith(
                    color: isSelected ? colorTheme.themBasedWhite : colorTheme.buttonPrimaryColor,
                  ),
                  backgroundColor: colorTheme.commonDividerBgColor,
                  shape: StadiumBorder(
                    side: BorderSide(color: colorTheme.buttonPrimaryColor),
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
                  "Track the status of all your job applications in one place",
                  style: context.textTheme.displaySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              gapW8(),
              if (state.totalCount != null)
                state.pageState == PageState.loading
                    ? const ShimmerLoader(
                        child: ShimmerBox(height: 12, width: 60, radius: 4),
                      )
                    : Text(
                        "${state.totalCount ?? 0} Applications",
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
