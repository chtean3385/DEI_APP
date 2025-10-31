import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';
import '../edit_profile_components/edit_skill_info.dart';

class MyKeySkill extends ConsumerWidget {
  const MyKeySkill({super.key});

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
                "Key Skills",
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => openEditBottomSheet(
                  context: context,
                  isDraggable: false,
                  content: const EditSkillInformation(isFromCommonEdit: false),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.primaryColor,
                  size: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          state.profileData?.skills?.isNotEmpty == true
              ? _skillChips(state.profileData?.skills ?? [])
              : Text(
                  "No skills information available",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _skillChips(List<String> selectedSkill) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: selectedSkill.map((skill) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 1, color: Colors.black12),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    skill,
                    style: navigatorKey.currentContext!.textTheme.displaySmall
                        ?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

Future<void> openEditSkill(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return EditSkillInformation(isFromCommonEdit: false);
    },
  );
}
