import 'package:dei_champions/constants/app_colors.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';
import '../edit_profile_components/edit_skill_info.dart';

class MyKeySkill extends ConsumerWidget {
  const MyKeySkill({super.key});

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
                  color: colorTheme.buttonPrimaryColor,
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
            const SizedBox(height: 12),
            _loaderChips()

          ],
        ),
      ),
    );
  }
  Widget _loaderChips(){
    return  SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(5, (index) {
          return const ShimmerBox(height: 20, width: 60,radius: 24,);
        }),
      ),
    );
  }

  Widget _skillChips(List<String> selectedSkill) {
    final colorTheme = navigatorKey.currentContext!.colors;
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: selectedSkill.map((skill) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: colorTheme.commonBg2Color,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 1, color: colorTheme.black12),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    skill,
                    style: navigatorKey.currentContext!.textTheme.displaySmall
                        ?.copyWith(color: colorTheme.black54),
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
