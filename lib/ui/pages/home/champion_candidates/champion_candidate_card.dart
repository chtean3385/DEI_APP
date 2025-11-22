import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/home/dei_champion_candidates/champion_list_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../search/components/search_job_card.dart';

/// 📌 Individual Job category Card
class ChampionCandidateCard extends StatelessWidget {
  final UserModel categoryModel;
  final GestureTapCallback? onTap;

  const ChampionCandidateCard({required this.categoryModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorTheme.cardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: colorTheme.themBasedWhite, width: 1),
        ),
        child: SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedNetworkImage(
                      imageUrl: categoryModel.profilePhotoUrl ?? "",
                      width: 60,
                      height: 60,
                      borderRadius: 30,
                    ),
                    gapW12(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoryModel.name ?? "",
                            style: theme.labelMedium,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                          gapH4(),
                          Text(
                            categoryModel.position ?? "Professional",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: context.textTheme.displaySmall?.copyWith(
                              color:  colorTheme.themBasedBlack,fontSize: 13
                            ),
                          ),
                          //
                          //
                          // Text(
                          //   categoryModel.workStatus ?? "candidate",
                          //   softWrap: true,
                          //   overflow: TextOverflow.ellipsis,
                          //   maxLines: 1,
                          //   textAlign: TextAlign.center,
                          //   style: context.textTheme.displaySmall?.copyWith(
                          //     color: Colors.black54,
                          //   ),
                          // ),
                        ],
                      ),
                    ),



                  ],
                ),
                gapH8(),
                Divider(thickness: 1,color: colorTheme.black12,height: 1,),
                gapH8(),
                gapH4(),

                _skillsRow(categoryModel.skills),
                const SizedBox(height: 12),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: colorTheme.black54,
                        ),
                        gapW2(),
                        Text(
                          "${ categoryModel.city ?? ""} ,${ categoryModel.state ?? ""}",
                          textAlign: TextAlign.left,
                          style: theme.displaySmall?.copyWith(
                            color: colorTheme.black54,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                                color: colorTheme.black54,
                              ),
                              gapW4(),
                              Flexible(
                                child: Text(
                                  categoryModel.salary ?? "",
                                  style: theme.displaySmall?.copyWith(
                                    color: colorTheme.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Icon(
                                Icons.work_outline_rounded,
                                size: 16,
                                color: colorTheme.black54,
                              ),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                    getExperienceLabel(workStatus: categoryModel.workStatus,experienceYears: categoryModel.totalExperienceYears),
                                  style: theme.displaySmall?.copyWith(color: colorTheme.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const SizedBox(height: 6),

                    Text(
                      " ${getShortTimeAgo(categoryModel.createdAt ?? DateTime.now())}",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: theme.displaySmall?.copyWith(
                        color: colorTheme.black45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double usedWidth = 0;
        const spacing = 8.0;

        List<String> visible = [];
        List<String> hidden = [];

        for (var skill in skills) {
          double chipWidth = _measureChipWidth(context, skill);

          if (visible.isEmpty) {
            // Always add first chip
            usedWidth = chipWidth;
            visible.add(skill);
          } else if (usedWidth + spacing + chipWidth <= maxWidth) {
            // Fits in single line
            usedWidth += spacing + chipWidth;
            visible.add(skill);
          } else {
            hidden.add(skill);
          }
        }

        // if there's overflow, add +N more chip
        if (hidden.isNotEmpty) {
          String lastChip = "+${hidden.length} more";

          double chipWidth = _measureChipWidth(context, lastChip);

          // Remove last visible chips until "+N more" fits
          while (visible.isNotEmpty &&
              usedWidth + spacing + chipWidth > maxWidth) {
            double removedChipWidth = _measureChipWidth(context, visible.last);
            visible.removeLast();
            usedWidth -= (visible.isEmpty ? removedChipWidth : removedChipWidth + spacing);
          }

          visible.add(lastChip);
        }

        return Row(
          children: [
            ...visible.map((s) => Padding(
              padding: const EdgeInsets.only(right: spacing),
              child: _tagChip(s),
            )),
          ],
        );
      },
    );
  }




  Widget _tagChip(String tag) {
    return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: navigatorKey.currentContext!.colors.commonBg2Color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,textAlign: TextAlign.center,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,fontSize: 10,
          color: navigatorKey.currentContext!.colors.black54,
        ),
      ),
    );
  }
}
class ShimmerChampionCandidateCard extends StatelessWidget {

  const ShimmerChampionCandidateCard();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(6),
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(16),
        ),
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundedNetworkImage(
                    imageUrl:  "",
                    width: 50,
                    height: 50,
                    borderRadius: 25,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 14, width: 100),
                        ),
                        SizedBox(height: 2),
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 10, width: 50),
                        ),
                        SizedBox(height: 2),
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 10, width: 50),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    height: 50,
                    child: const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      width: 1, // space around divider
                    ),
                  ),
                  const SizedBox(width: 4),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: Colors.white,
                          ),
                          gapW2(),
                          ColoredBox(
                            color: Colors.white,
                            child: SizedBox(height: 10, width: 50),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.timelapse_sharp,
                            size: 14,
                            color: Colors.white,
                          ),
                          gapW2(),
                          ColoredBox(
                            color: Colors.white,
                            child: SizedBox(height: 10, width: 50),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              _skillsRow()
            ],
          ),
        ),
      ),
    );
  }

  Widget _skillsRow() {
    return SizedBox(
      height: 20, // fixed height for chips
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(4, (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _tagChip("xxxx"),
        )).toList(),
      ));
  }


  Widget _tagChip(String tag) {
    return // Tag chip
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          tag,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      );
  }
}

double _measureChipWidth(BuildContext context, String text) {
  final style = navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  final textSpan = TextSpan(text: text, style: style);
  final tp = TextPainter(
    text: textSpan,
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();

  return tp.width + 20; // padding: 10 left + 10 right
}
