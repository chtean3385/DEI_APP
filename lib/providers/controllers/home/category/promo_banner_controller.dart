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

  @override
  void dispose() {
    debugPrint("🔥 PromoBannerController disposed");
    super.dispose();
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
    title: "Find your next job faster",
    subTitle:
    "Search thousands of jobs and apply directly from the app in just a few taps.",
    buttonLabel: "Search Jobs",
    isBannerImage: false,
  ),
  PromoBannerModel(
    id: "2",
    imageUrl:
    "https://deichampion.com/_next/image?url=https%3A%2F%2Fmobile.deichampion.com%2Fuploads%2Fimages%2F1768815751826-976933292.jpeg&w=3840&q=75",
    buttonLabel: "Browse Jobs",
    isBannerImage: true,
  ),
  PromoBannerModel(
    id: "3",
    title: "Apply with confidence",
    subTitle:
    "Discover roles that match your skills and experience perfectly.",
    buttonLabel: "Apply Now",
    isBannerImage: false,
  ),
  PromoBannerModel(
    id: "4",
    imageUrl:
    "https://deichampion.com/_next/image?url=https%3A%2F%2Fmobile.deichampion.com%2Fuploads%2Fimages%2F1768815751843-228173371.jpeg&w=3840&q=75",
    buttonLabel: "Explore Careers",
    isBannerImage: true,
  ),
  PromoBannerModel(
    id: "5",
    title: "Your career starts here",
    subTitle:
    "Find verified job listings and apply securely with ease.",
    buttonLabel: "Find Jobs",
    isBannerImage: false,
  ),
];

