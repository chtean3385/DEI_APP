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
print(" state.profileData?.resume -- ${ state.profileData?.resume}");
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
                        getFileNameFromPath(state.profileData?.resume)  ,
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ---------- Top Row ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ShimmerBox(height: 16, width: 100),
                ShimmerBox(height: 14, width: 14),
              ],
            ),
            const SizedBox(height: 8),

            // ---------- Bottom Row ----------
            Row(
              children: [
                const ShimmerBox(height: 14, width: 14),
                const SizedBox(width: 8),
                // Use Expanded to fill remaining space
                Expanded(
                  child: ShimmerBox(
                    height: 10,
                    width: double.infinity,
                    // width removed so it flexibly fills available space
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
String getFileNameFromPath(String? path) {
  if (path == null || path.trim().isEmpty) {
    return "no resume added";
  }

  try {
    return path.split('/').last;
  } catch (e) {
    return  "no resume added";
  }
}
