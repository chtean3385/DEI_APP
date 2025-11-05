import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/widgets/others/rounded_network_image.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../../main.dart';
import '../../../../models/common/blog_model.dart';

class BlogCard extends StatelessWidget {
  final BlogModel item;

  const BlogCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final plainText = html_parser.parse(item.description).body?.text ?? '';
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shadowColor: Colors.black,
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
                  style: theme.displaySmall?.copyWith(color: Colors.black87),
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
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  DateFormat(
                                    'MMMM d, yyyy',
                                  ).format(item.createdAt ?? DateTime.now()),
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.displaySmall?.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapW16(),
                    Text(
                      "1 mins to read",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: theme.displaySmall?.copyWith(
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
    );
  }
}

Widget commonChip(String tag) {
  return // Tag chip
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.bg,
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
        color: AppColors.primaryColor,
      ),
    ),
  );
}
