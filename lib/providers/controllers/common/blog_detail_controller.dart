import 'package:dei_champions/models/common/blog_model.dart';
import 'package:dei_champions/models/state_models/common/blog_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../constants/app_strings.dart';
import '../../../service/common/common_service.dart';

class BlogDetailController extends StateNotifier<BlogDetailState> {
  final CommonService _service = CommonService();
  final String id;

  BlogDetailController(this.id) : super(BlogDetailState.initial()) {
    fetchData(id);
  }

  Future<void> fetchData(String id) async {
    state = state.copyWith(pageState: PageState.loading);

    try {
      final result = await _service.getBlogDetails(id);

      // Extract the blog data safely
      final dataMap = (result is Map && result['data'] is Map)
          ? result['data'] as Map<String, dynamic>
          : (result as Map<String, dynamic>);

      final blog = BlogModel.fromJson(dataMap);

      // Update the state with a single BlogModel
      state = state.copyWith(
        pageState: PageState.success,
        data: blog, // keeping it as list if UI expects a list
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint("❌ BlogDetailController fetchData error: ${e.toString()}");
      showSnackBar(AppStrings.somethingWentWrong);
    }
  }




}
Future<void> openWebUrl(String blogId) async {
  final uri = Uri.tryParse("https://frontend-dei.vercel.app/blog-details?blog=$blogId");

  if (uri == null) return;

  if (!await canLaunchUrl(uri)) {
    throw 'Could not launch $uri';
  }

  await launchUrl(
    uri,
    mode: LaunchMode.externalApplication, // opens browser
  );
}


Future<void> shareBlog({
  required String blogId,
  required String title,
}) async {
  try {
    final url =
        "https://frontend-dei.vercel.app/blog-details?blog=$blogId";

    final safeTitle =
    title.trim().isEmpty ? 'DEI Blog' : title.trim();

    final message = '''
📘 $safeTitle

✨ Thought-provoking insights from the DEI platform.
Explore ideas that inspire inclusion, learning, and growth.

Read the full blog here 👇
$url
''';

    await SharePlus.instance.share(
      ShareParams(
        text: message.trim(), // extra safety
        subject: safeTitle,
      ),
    );
  } catch (e, s) {
    debugPrint('❌ Share failed: $e');
    debugPrintStack(stackTrace: s);
    showSnackBar('Unable to share right now');
  }
}



