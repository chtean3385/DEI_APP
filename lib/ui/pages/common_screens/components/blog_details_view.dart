import 'package:dei_champions/constants/app_drawables.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:dei_champions/models/common/blog_model.dart';
import 'package:dei_champions/models/state_models/common/blog_detail_state.dart';
import 'package:dei_champions/providers/controllers/common/blog_detail_controller.dart';
import 'package:dei_champions/ui/pages/search/components/search_job_card.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:intl/intl.dart';
import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../../../widgets/others/rounded_network_image.dart';
import 'blog_card.dart';

class BlogDetailsView extends ConsumerWidget {
  final String id;

  BlogDetailsView(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(blogDetailProvider(id));
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data == null) {
      return EmptyWidget();
    } else {
      return _data(state, context);
    }
  }

  Widget _data(BlogDetailState state, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final item = state.data;
    final colorTheme = context.colors;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Image.asset(
                    AppDrawables.blogBg,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(color: colorTheme.commonDividerBgColor),
                  child: Column(
                    children: [
                      Text(
                        item?.title ?? "",
                        style: theme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                      gapH16(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RoundedNetworkImage(
                            height: 40,
                            width: 40,
                            imageUrl: item?.authorImage ?? "",
                            borderRadius: 20,
                          ),
                          gapW16(),
                          Text(
                            item?.authorName ?? "",
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: theme.labelMedium?.copyWith(
                              color: colorTheme.black54,
                            ),
                          ),
                        ],
                      ),
                      gapH8(),
                      Row(
                        mainAxisSize: MainAxisSize.min,

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 20,
                                color: colorTheme.black54,
                              ),
                              gapW6(),
                              Text(
                                DateFormat(
                                  'MMMM d, yyyy',
                                ).format(item?.createdAt ?? DateTime.now()),
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: theme.displaySmall?.copyWith(
                                  color: colorTheme.black54,
                                ),
                              ),
                            ],
                          ),
                          gapW16(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 20,
                                color: colorTheme.black54,
                              ),
                              gapW6(),
                              Text(
                                "8 mins to read",
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: theme.displaySmall?.copyWith(
                                  color: colorTheme.black54,
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
            _itemDetails(item),
          ],
        ),
      ),
    );
  }

  Widget _shimmerLoader() {
    return SafeArea(
      child: SingleChildScrollView(
        child: ShimmerLoader(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ColoredBox(
                      color: Colors.white54,
                      child: SizedBox(height: 150, width: double.infinity),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Column(
                      children: [
                        ShimmerBox(height: 16, width: double.infinity),
                        gapH16(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ShimmerBox(height: 40, width: 40, radius: 20),
                            gapW16(),
                            ShimmerBox(height: 12, width: 100),
                          ],
                        ),
                        gapH8(),
                        Row(
                          mainAxisSize: MainAxisSize.min,

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                gapW6(),
                                ShimmerBox(height: 12, width: 100),
                              ],
                            ),
                            gapW16(),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                gapW6(),
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
              _itemDetailsShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemDetails(BlogModel? item) {
    final theme = Theme.of(navigatorKey.currentContext!).textTheme;
    final plainText = html_parser.parse(item?.description).body?.text ?? '';
    final colorTheme = navigatorKey.currentContext!.colors;
    return Card(
      elevation: 2,
      color: colorTheme.commonDividerBgColor,
      margin: EdgeInsets.all(16),
      shadowColor: colorTheme.themBasedBlack,
      // surfaceTintColor: AppColors.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          RoundedNetworkImage(
            height: 200,
            width: double.infinity,
            imageUrl: item?.image ?? "",
            borderRadius: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  plainText,
                  style: theme.displaySmall?.copyWith(color: colorTheme.black87),
                  // maxLines: 3,
                  // softWrap: true,
                  // overflow: TextOverflow.ellipsis,
                ),
                gapH16(),
                Text(
                  "Thank you for reading this blog post. We hope you found it informative and useful.",
                  style: theme.displaySmall?.copyWith(color: colorTheme.black87),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                gapH16(),
                BlogTagsAndShare(tags: ['Eventss', 'Career', 'Interview'],onShareTap: ()=>shareBlog(title:AppStrings.appName ,blogId: item?.id ?? ""),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemDetailsShimmer() {
    return Card(
      elevation: 2,
      color: Colors.transparent,
      margin: EdgeInsets.all(16),
      shadowColor: Colors.white,
      // surfaceTintColor: AppColors.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          ShimmerBox(height: 200, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ShimmerBox(height: 12, width: double.infinity, radius: 0),
                gapH4(),
                ShimmerBox(height: 12, width: double.infinity, radius: 0),
                gapH4(),
                ShimmerBox(height: 12, width: 250, radius: 8),
                gapH16(),
                ShimmerBox(height: 12, width: double.infinity, radius: 0),
                gapH4(),
                ShimmerBox(height: 12, width: double.infinity, radius: 0),
                gapH4(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlogTagsAndShare extends StatelessWidget {
  final List<String> tags;
  final VoidCallback? onShareTap;

  const BlogTagsAndShare({super.key, required this.tags,this.onShareTap,});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final colorTheme = context.colors;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Divider(thickness: 1, color: colorTheme.black12),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8, // horizontal space between chips
          runSpacing: 8, // vertical space between lines
          children: tags.map((s) => commonChip(s,isFromDetails: true)).toList(),
        ),
        gapH16(),
        GestureDetector(
          onTap: onShareTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Share',
                style: theme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorTheme.grey600,
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                FontAwesomeIcons.facebookF,
                size: 18,
                color: colorTheme.grey600,
              ),
              const SizedBox(width: 12),
              Icon(
                FontAwesomeIcons.twitter,
                size: 18,
                color: colorTheme.grey600,
              ),
              const SizedBox(width: 12),
              Icon(
                FontAwesomeIcons.pinterestP,
                size: 18,
                color: colorTheme.grey600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
