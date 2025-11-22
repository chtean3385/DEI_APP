import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';
import '../edit_profile_components/edit_work_experience_info.dart';

class ExperienceDetails extends ConsumerWidget {
  const ExperienceDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
    final colorTheme = context.colors;

    return state.pageState == PageState.loading
        ? _loader() :  Container(
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
                "Experience",
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap:() => openDynamicFormSheet(
                    context:context,
                    child: const EditWorkExpInformation(isFromCommonEdit: false),
                  ),
                  child: Icon(Icons.edit_outlined,color: colorTheme.buttonPrimaryColor,size: 15))
            ],
          ),
        state.profileData?.experience?.isNotEmpty == true ?  ListView.separated(
            padding: EdgeInsets.only(top: 12),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return item(
                context,
                state.profileData?.experience![index] ??
                    ExperienceModel(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: colorTheme.black12, height: 48);
            },
            itemCount: state.profileData?.experience?.length ?? 0,
          ) :  Text(
           "No experience information available",
          style: context.textTheme.labelLarge?.copyWith(
            color: colorTheme.buttonPrimaryColor,
          ),
        ),
        ],
      ),
    );
  }
  Widget _loader(){
    return ShimmerLoader(
      child:  Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(height: 16, width: 200),
                ShimmerBox(height: 14, width:14)
              ],
            ),
            gapH8(),
            itemLoading()
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context, ExperienceModel data) {

    final colorTheme = context.colors;
    final end = data.isCurrentlyWorking == true
        ? 'Present'
        : _formatDate(data.endDate);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                data.position ?? "",
                style: context.textTheme.labelLarge?.copyWith(
                  color: colorTheme.buttonPrimaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${_formatDate(data.startDate)} - $end",
              style: context.textTheme.displaySmall?.copyWith(
                color: colorTheme.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          data.companyName ?? "",
          style: context.textTheme.labelLarge?.copyWith(color: colorTheme.black54),
        ),
        const SizedBox(height: 2),
        Text(
          data.description ?? "",
          style: context.textTheme.displaySmall?.copyWith(
            color: colorTheme.black54,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
  Widget itemLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: ShimmerBox(height: 12, width: 200)),
            gapW8(),
            ShimmerBox(height: 10, width: 100),
          ],
        ),
        const SizedBox(height: 2),
        ShimmerBox(height: 12, width: 200),
        const SizedBox(height: 2),
        ShimmerBox(height: 10, width:double.infinity),
        const SizedBox(height: 2),
        ShimmerBox(height: 10, width:double.infinity),

      ],
    );
  }
}

String _formatDate(DateTime? date) {
  if (date == null) return '';
  return DateFormat('MMM - yyyy').format(date); // e.g., Jul - 2025
}

