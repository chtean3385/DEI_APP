import 'package:dei_champions/models/home/job_services/job_service_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../models/state_models/home/job_service_state.dart';
import '../../../../service/home/job_category_service.dart';
import '../../../../widgets/others/snack_bar.dart';

class JobServiceController extends StateNotifier<JobServiceState> {
  final Ref _ref;
  final JobCategoryService _jobCategoryService = JobCategoryService();

  JobServiceController(this._ref) : super(JobServiceState.initial()) {
    fetchJobServices();
  }
  @override
  void dispose() {
    debugPrint("🔥 JobServiceController disposed");
    super.dispose();
  }

  Future<void> fetchJobServices() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _jobCategoryService.getJobServicesData();

      // since API returns a List
      final servicesData = (result as List)
          .map((e) => JobServiceModel.fromJson(e))
          .toList();

      state = state.copyWith(pageState: PageState.success, data: servicesData);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch fetchJobServices -${e.toString()}");
      showSnackBar(e.toString());
    }
  }
}
