import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/controllers/profile/employee_profile_controller.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';

class ContactDetails extends ConsumerWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = context.colors;
    final state = ref.watch(employeeProfileProvider);
    return state.pageState == PageState.loading
        ? _loader()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorTheme.jobCardBgColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.black12, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Basic Details",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ViewAllButton(
                      showArrow: true,
                      text: "View Resume",
                      isSmall: true,
                      onPressed: () =>
                          viewResumeFromUrl(state.profileData?.resume ?? ""),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.work, color: colorTheme.black54, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.profileData?.workStatus ?? "",
                        style: context.textTheme.displaySmall?.copyWith(
                          color: colorTheme.black54,fontSize: 13
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.currency_rupee, color: colorTheme.black54, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.profileData?.preferences?.salaryRange?.range ??
                            'Not specified',
                        style: context.textTheme.displaySmall?.copyWith(
                          color: colorTheme.black54,fontSize: 13
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.email, color: colorTheme.black54, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.profileData?.email ?? 'Not specified',
                        style: context.textTheme.displaySmall?.copyWith(
                          color: colorTheme.black54,fontSize: 13
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.phone, color: colorTheme.black54, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.profileData?.mobile ?? 'Not specified',
                        style: context.textTheme.displaySmall?.copyWith(
                          color: colorTheme.black54,fontSize: 13
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: colorTheme.black54, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "${state.profileData?.address ?? ""}, ${state.profileData?.city ?? ""}, ${state.profileData?.state ?? ""}, ${state.profileData?.country ?? ""}",
                        style: context.textTheme.displaySmall?.copyWith(
                          color: colorTheme.black54,fontSize: 13
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Widget _loader() {
    return ShimmerLoader(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(height: 16, width: 200),

                ShimmerBox(height: 14, width: 100),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 12, width: 14),
                const SizedBox(width: 8),
                ShimmerBox(height: 10, width: 100),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 12, width: 14),
                const SizedBox(width: 8),
                ShimmerBox(height: 10, width: 100),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 12, width: 14),
                const SizedBox(width: 8),
                ShimmerBox(height: 10, width: 100),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 12, width: 14),
                const SizedBox(width: 8),
                ShimmerBox(height: 10, width: 100),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(height: 14, width: 14),
                const SizedBox(width: 8),
                ShimmerBox(height: 12, width: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
