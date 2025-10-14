import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/profile/edit_profile/work_experience_model.dart';
import '../../../../providers/providers.dart';
import '../edit_profile_components/edit_work_experience_info.dart';

class ExperienceDetails extends ConsumerWidget {
  const ExperienceDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editProfileProvider);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black12, width: 1),
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
                  onTap:() => openEditExperience(context),
                  child: Icon(Icons.edit_outlined,color: AppColors.primaryColor,size: 15))
            ],
          ),
          ListView.separated(
            padding: EdgeInsets.only(top: 12),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return item(
                context,
                state.profileData?.workExperience![index] ??
                    WorkExperienceInfoModel(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.black12, height: 48);
            },
            itemCount: state.profileData?.workExperience?.length ?? 0,
          ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, WorkExperienceInfoModel data) {

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
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${_formatDate(data.startDate)} - $end",
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          data.companyName ?? "",
          style: context.textTheme.labelLarge?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 2),
        Text(
          data.description ?? "",
          style: context.textTheme.displaySmall?.copyWith(
            color: Colors.black54,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

String _formatDate(DateTime? date) {
  if (date == null) return '';
  return DateFormat('MMM - yyyy').format(date); // e.g., Jul - 2025
}
Future<void> openEditExperience(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: EditWorkExpInformation(isFromCommonEdit: false),
            ),
          );
        },
      );
    },
  );
}
