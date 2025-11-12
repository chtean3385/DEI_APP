import 'package:dei_champions/constants/app_styles.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
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
                            style: context.textTheme.labelSmall?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),


                          Text(
                            categoryModel.workStatus ?? "candidate",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: context.textTheme.displaySmall?.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
                gapH8(),
                Divider(thickness: 1,color: Colors.black12,height: 1,),
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
                          color: Colors.black54,
                        ),
                        gapW2(),
                        Text(
                          categoryModel.state ?? categoryModel.country ?? "India",
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          size: 16,
                          color: Colors.black54,
                        ),
                        gapW4(),
                        Text(
                          categoryModel.salary ?? "",
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.black54,
                        ),
                        gapW4(),
                        Text(
                          " ${getTimeAgo(categoryModel.createdAt ?? DateTime.now())}",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: theme.displaySmall?.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
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

  // Widget _skillsRow(List<String>? skills) {
  //   if (skills == null || skills.isEmpty) return const SizedBox.shrink();
  //
  //   return SizedBox(
  //     height: 20, // fixed height for chips
  //     child: ListView(
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       children: skills.map((s) => Padding(
  //         padding: const EdgeInsets.only(right: 8),
  //         child: _tagChip(s),
  //       )).toList(),
  //     ),
  //   );
  // }
  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8, // horizontal space between chips
      runSpacing: 8, // vertical space between rows
      children: skills.map((s) => _tagChip(s)).toList(),
    );
  }


  Widget _tagChip(String tag) {
    return // Tag chip
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        maxLines: 1,overflow: TextOverflow.ellipsis,softWrap: true,textAlign: TextAlign.center,
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,fontSize: 10,
          color: Colors.black,
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

