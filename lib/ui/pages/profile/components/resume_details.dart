import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_resume.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';

class ResumeDetails extends ConsumerWidget {

  const ResumeDetails({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
    final colorTheme = context.colors;

    return state.pageState == PageState.loading
        ? _loader()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorTheme.jobCardBgColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: colorTheme.black12, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Resume",
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => openEditBottomSheet(
                        context: context,
                        isDraggable: false,
                        content: const EditResumeInformation(
                          isFromCommonEdit: false,
                        ),
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: colorTheme.buttonPrimaryColor,
                        size: 15,
                      ),
                    ),
                  ],
                ),
                gapH16(),
                Row(
                  children: [
                    Icon(
                      Icons.picture_as_pdf_sharp,
                      size: 20,
                      color: Colors.red.shade600,
                    ),
                    gapW8(),
                    Expanded(
                      child: Text(
                        state.profileData?.resume ?? "no resume added",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: colorTheme.buttonPrimaryColor,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(height: 16, width: 100),
                ShimmerBox(height: 14, width: 14),
              ],
            ),
            gapH8(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(height: 14, width: 14),
                gapW8(),
                ShimmerBox(height: 10, width: 300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
