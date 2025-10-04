import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/home/dei_champion_candidates/champion_list_model.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import '../../../../widgets/pickers/star_rating.dart';

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
          width: 280,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RoundedNetworkImage(
                      imageUrl: categoryModel.profilePhotoUrl ?? "",
                      width: 60,
                      height: 60,
                      borderRadius: 30,
                    ),
                    const SizedBox(width: 12),
                    Flexible(
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
                          Text(
                            categoryModel.position ?? "Professional",
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: context.textTheme.displaySmall?.copyWith(
                              color: Colors.black54,
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
                          // ⭐ Star rating
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StarRatingDisplay(
                                size: 15,
                                rating: 4.5,
                                starCount: 5,
                              ),
                              gapW8(),
                              Text(
                                "(50)",
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
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Excels in pattern recognition, data visualization, and detailed reporting. Thrives in structured, calm environments.",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  style: context.textTheme.displaySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),

                _skillsRow(categoryModel.skills),
                gapH8(),
                Divider(color: Colors.black12, thickness: 1),
                gapH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Colors.black54,
                        ),
                        gapW8(),
                        Text(
                          categoryModel.city ?? categoryModel.country ?? "",
                          style: theme.bodyMedium?.copyWith(
                            color: Colors.black45,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timelapse_sharp,
                          size: 20,
                          color: Colors.black54,
                        ),
                        gapW8(),
                        Text(
                          "1500/hr",
                          style: theme.bodyMedium?.copyWith(
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
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

  Widget _skillsRow(List<String>? skills) {
    if (skills == null || skills.isEmpty) {
      return const SizedBox.shrink(); // nothing if null/empty
    }

    return Wrap(
      // better than Row (handles overflow by wrapping)
      spacing: 8, // horizontal space
      runSpacing: 6, // vertical space if wrapped
      children: skills.map((s) => _tagChip(s)).toList(),
    );
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
        style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,
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
    final theme = Theme.of(context).textTheme;
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
        width: 280,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundedNetworkImage(
                    imageUrl:  "",
                    width: 60,
                    height: 60,
                    borderRadius: 30,
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 14, width: 100),
                        ),
                        const SizedBox(height: 2),
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 10, width: 150),
                        ),
                        const SizedBox(height: 2),
                        ColoredBox(
                          color: Colors.white,
                          child: SizedBox(height: 10, width: 170),
                        ),
                        // ⭐ Star rating
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarRatingDisplay(
                              size: 15,
                              rating: 4.5,
                              starCount: 5,
                            ),
                            gapW8(),
                            Text(
                              "(50)",
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
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 150),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 170),
              ),
              const SizedBox(height: 2),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 170),
              ),
              const SizedBox(height: 12),

              _dummyTagsRow(4),
              gapH8(),
              Divider(color: Colors.white, thickness: 1),
              gapH8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: Colors.black54,
                      ),
                      gapW8(),
                      Text(
                         "location",
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.black45,
                        ),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timelapse_sharp,
                        size: 20,
                        color: Colors.black54,
                      ),
                      gapW8(),
                      Text(
                        "    ",
                        style: theme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _dummyTagsRow(int count) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: List.generate(
        count,
            (index) => _tagChip('xxxx'), // empty string for dummy
      ),
    );
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
          style: navigatorKey.currentContext!.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      );
  }
}

