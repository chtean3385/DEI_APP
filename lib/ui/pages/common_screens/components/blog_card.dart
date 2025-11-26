import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:dei_champions/widgets/others/view_all_button.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../main.dart';
import '../../../../models/common/blog_model.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class BlogCard extends StatelessWidget {
  final BlogModel item;

  const BlogCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    final plainText = html_parser.parse(item.description).body?.text ?? '';
    return GestureDetector(
      onTap:()=>AppNavigator.loaBlogDetailsScreen(item.id ?? "") ,
      child: Card(
        elevation: 2,
        color: colorTheme.themBasedWhite,
        margin: EdgeInsets.zero,
        shadowColor: colorTheme.themBasedBlack,
        // surfaceTintColor: AppColors.primaryColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            RoundedNetworkImage(
              height: 250,
              width: double.infinity,
              imageUrl: item.image ?? "",
              borderRadius: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonChip(item.category ?? ""),
                  gapH8(),
                  Text(item.title ?? "", style: theme.labelMedium),
                  gapH8(),
                  Text(
                    plainText,
                    style: theme.displaySmall?.copyWith(color: colorTheme.black87),
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  gapH16(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 🟩 Wrap these in an inner Row to center them together
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // center vertically
                          children: [
                            RoundedNetworkImage(
                              height: 40,
                              width: 40,
                              imageUrl: item.authorImage ?? "",
                              borderRadius: 20,
                            ),
                            gapW16(),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.authorName ?? "",
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.labelMedium?.copyWith(
                                      color: colorTheme.black54,
                                    ),
                                  ),
                                  gapH4(),

                                  Text(
                                    DateFormat(
                                      'MMMM d, yyyy',
                                    ).format(item.createdAt ?? DateTime.now()),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.displaySmall?.copyWith(
                                      color: colorTheme.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapW16(),
                      Column(
                        children: [

                          CustomThemeButton(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text(
                                  "View More",
                                  style: navigatorKey
                                      .currentContext!
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(color: colorTheme.buttonPrimaryColor),
                                ),
                                gapW4(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                  color: colorTheme.buttonPrimaryColor,
                                ),
                              ],
                            ),
                            color: colorTheme.cardBgColor,
                            borderColor: colorTheme.buttonPrimaryColor.withValues(alpha: .1),
                            radius: 30,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            onTap: null
                          ),
                          gapH4(),
                          Text(
                            "1 mins to read",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: theme.displaySmall?.copyWith(
                              color: colorTheme.black54,
                              fontSize: 10
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget commonChip(String tag, {bool isFromDetails = false}) {
  final colorTheme = navigatorKey.currentContext!.colors;

  return // Tag chip
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: isFromDetails ? colorTheme.cardBgColor :  colorTheme.commonBg2Color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      tag,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      textAlign: TextAlign.center,
      style: navigatorKey.currentContext!.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: colorTheme.buttonPrimaryColor,
      ),
    ),
  );
}

class ShimmerBlogCard extends StatelessWidget {
  const ShimmerBlogCard();

  @override
  Widget build(BuildContext context) {
    return ShimmerLoader(
      child: Card(
        elevation: 2,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black,
        // surfaceTintColor: AppColors.primaryColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          children: [
            ShimmerBox(height: 250, width: double.infinity, radius: 0),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerBox(height: 24, width: 100, radius: 8),
                  gapH8(),
                  ShimmerBox(height: 16, width: double.infinity, radius: 0),
                  gapH4(),
                  ShimmerBox(height: 12, width: 250, radius: 8),
                  gapH8(),
                  ShimmerBox(height: 12, width: double.infinity, radius: 0),
                  gapH4(),
                  ShimmerBox(height: 12, width: double.infinity, radius: 0),
                  gapH4(),
                  ShimmerBox(height: 12, width: 250, radius: 8),

                  gapH16(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 🟩 Wrap these in an inner Row to center them together
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // center vertically
                          children: [
                            ShimmerBox(height: 40, width: 40, radius: 20),
                            gapW16(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShimmerBox(height: 12, width: 150),
                                  gapH8(),
                                  ShimmerBox(height: 10, width: 150),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      gapW16(),
                      Column(
                        children: [
                          ShimmerBox(height: 20, width: 100, radius: 8),
                          gapH4(),
                          ShimmerBox(height: 12, width: 100),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCardHorizontal extends StatelessWidget {
  final BlogModel item;

  const BlogCardHorizontal({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;
    return GestureDetector(
      onTap:()=>AppNavigator.loaBlogDetailsScreen(item.id ?? "") ,
      child: SizedBox(
        width: 180,
        child: Card(
          elevation: 0,
          color: colorTheme.cardBgColor,
          margin: EdgeInsets.zero,
          shadowColor: colorTheme.themBasedBlack,
          // surfaceTintColor: AppColors.primaryColor,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(color: colorTheme.black12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                RoundedNetworkImage(
                  height: 100,
                  width: double.infinity,
                  imageUrl: item.image ?? "",
                  borderRadius: 4,
                ),
                gapH8(),
                Expanded(child: Text(item.title ?? "",
                    textAlign: TextAlign.left,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: theme.labelSmall?.copyWith(height: 1.2))),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          RoundedNetworkImage(
                            height: 10,
                            width: 10,
                            imageUrl: item.authorImage ?? "",
                            borderRadius: 5,
                          ),
                          gapW4(),
                          Expanded(
                            child: Text(
                              item.authorName ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.displaySmall?.copyWith(
                                color: colorTheme.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // time ago text
                    Flexible(
                      child: Text(
                        " ${getShortTimeAgo(item.createdAt ?? DateTime.now())}",
                        overflow: TextOverflow.ellipsis,
                        style: theme.displaySmall?.copyWith(
                          color: colorTheme.black45,
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
class BlogCardHorizontalShimmer extends StatelessWidget {

  const BlogCardHorizontalShimmer();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 2,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        shadowColor: Colors.black,
        // surfaceTintColor: AppColors.primaryColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),side: BorderSide(color: Colors.white,width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShimmerBox(height: 150, width: double.infinity, radius: 4),

              gapH8(),
              ShimmerBox(height: 12, width: double.infinity, radius: 0),
              gapH4(),

              ShimmerBox(height: 10, width: 150, radius: 0),

            ],
          ),
        ),
      ),
    );
  }
}
