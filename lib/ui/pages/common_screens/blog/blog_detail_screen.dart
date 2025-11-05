import 'package:flutter/material.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/others/app_bar_common.dart';
import '../components/blog_details_view.dart';

class BlogDetailScreen extends StatelessWidget {
  final String id;
  const BlogDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: appBarCommon(
        title: "Blog Details",
        arrowLeft: true,
        titleStyleSmall: true,
      ),
      body: BlogDetailsView(id),
    );
  }
}
