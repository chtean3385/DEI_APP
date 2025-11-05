import 'package:dei_champions/models/common/blog_model.dart';
import 'package:dei_champions/models/state_models/common/blog_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../service/common/common_service.dart';

class BlogController extends StateNotifier<BlogState> {
  final CommonService _service = CommonService();

  BlogController() : super(BlogState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getBlogData();
      final List<dynamic> blogList =
      (result is Map && result['data'] is List)
          ? result['data']
          : (result as List);

      final data = blogList
          .map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch BlogController fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
