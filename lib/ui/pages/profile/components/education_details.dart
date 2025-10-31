import 'package:dei_champions/models/profile/edit_profile/education_info_model.dart';
import 'package:dei_champions/ui/pages/profile/edit_profile_components/edit_education_info.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';

class EducationDetails extends ConsumerWidget {
  const EducationDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
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
                "Education",
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => openEditBottomSheet(
                  context: context,
                  isDraggable: true,
                  content: const EditEducationInformation(
                    isFromCommonEdit: false,
                  ),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryColor,
                  size: 15,
                ),
              ),
            ],
          ),
          state.profileData?.education?.isNotEmpty == true
              ? ListView.separated(
                  padding: EdgeInsets.only(top: 12),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return item(
                      context,

                      state.profileData?.education![index] ?? EducationModel(),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(color: Colors.black12, height: 48);
                  },
                  itemCount: state.profileData?.education?.length ?? 0,
                )
              : Text(
                  "No education information available",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
        ],
      ),
    );
  }

  Widget item(BuildContext context, EducationModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                data.degree ?? "",
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              data.graduationYear?.toString() ?? "",
              style: context.textTheme.displaySmall?.copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          data.institution ?? "",
          style: context.textTheme.labelLarge?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
