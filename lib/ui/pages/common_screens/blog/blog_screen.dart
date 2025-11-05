import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/blog_view.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(
        title: "Blog",
        arrowLeft: true,
        titleStyleSmall: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColoredBox(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Latest Posts",
                          style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        // gapH8(),
                        Text(
                          "Don't miss the trending news",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BlogView(),
            ],
          ),
        ),
      ),
    );
  }
}
