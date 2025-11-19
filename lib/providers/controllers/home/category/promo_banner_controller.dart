import 'dart:math';

import 'package:dei_champions/models/state_models/home/promo_banner_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/home/promo_banner/promo_banner_model.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';


class PromoBannerController extends StateNotifier<PromoBannerState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  PromoBannerController(this._ref) : super(PromoBannerState.initial()) {
    fetchPromoBanners();
  }

  Future<void> fetchPromoBanners() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      // final result = await _jobCategoryService.getPromoBanners();
      // final result = bannerList;
      //
      // // since API returns a List
      // final categoryData = (result as List)
      //     .map((e) => PromoBannerModel.fromJson(e))
      //     .toList();
      final random = Random();
     final currentBanner = bannerList[random.nextInt(bannerList.length)];

      state = state.copyWith(
        pageState: PageState.success,
        data: currentBanner,
      );
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchPromoBanners -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
final List<PromoBannerModel> bannerList = [
  PromoBannerModel(
    id: "1",
    title: "Level up your career with Pro!",
    subTitle:
    "Get an enhanced profile, hidden jobs, AI resume maker, AI interview tools, & more",
    buttonLabel: "Know more",
    isBannerImage: false,
  ),
  PromoBannerModel(
    id: "2",
    imageUrl: "https://pub-141831e61e69445289222976a15b6fb3.r2.dev/1763544784415-ywhz4crxxh8-1763544782453_vaqst2_free_photo_we_are_.jpeg",
    buttonLabel: "Join Now",
    isBannerImage: true,
  ),
  PromoBannerModel(
    id: "3",
    title: "Boost your job visibility instantly!",
    subTitle: "Stand out to top employers looking for talent like you.",
    buttonLabel: "Get Boost",
    isBannerImage: false,
  ),
  PromoBannerModel(
    id: "4",
    imageUrl: "https://pub-141831e61e69445289222976a15b6fb3.r2.dev/1763544784481-xguxhl93h0c-1763544782454_1tx0tb_should_i_apply_for_a.jpeg",
    buttonLabel: "View Offers",
    isBannerImage: true,
  ),
  PromoBannerModel(
    id: "5",
    imageUrl: "https://pub-141831e61e69445289222976a15b6fb3.r2.dev/1763544784555-6w42prgzwz3-1763544782454_m5ftmk_must-ask_questions_b.jpeg",
    buttonLabel: "View Jobs",
    isBannerImage: true,
  ),
];
