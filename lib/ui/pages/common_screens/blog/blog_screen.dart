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
      body: BlogListView(),
    );
  }
}
