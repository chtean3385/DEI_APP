import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/employer/application_model.dart';
import '../../../../models/state_models/employer/emplyer_applications_state.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../../constants/enums.dart';

class EmployerApplicationsController extends StateNotifier<EmployerApplicationState> {
  EmployerApplicationsController() : super(EmployerApplicationState.initial()) {
    fetchData();
  }

  final List<ApplicationModel> _applications = [
    ApplicationModel(
      id: "1",
      profileImage: "https://randomuser.me/api/portraits/men/32.jpg",
      userName: "Yogharaj Raja",
      userType: "Student",
      location: "Rapar",
      appliedOn: DateTime(2025, 8, 19),
      applicationStatus: "new",
      isActive: true,
    ),
    ApplicationModel(
      id: "2",
      profileImage: "https://randomuser.me/api/portraits/women/45.jpg",
      userName: "Gree",
      userType: "Experienced",
      location: "Savarkundla",
      appliedOn: DateTime(2025, 9, 18),
      applicationStatus: "rejected",
      isActive: true,
    ),
    ApplicationModel(
      id: "3",
      profileImage: "https://randomuser.me/api/portraits/men/14.jpg",
      userName: "Harsh Mehta",
      userType: "Student",
      location: "Ahmedabad",
      appliedOn: DateTime(2025, 9, 12),
      applicationStatus: "reviewed",
      isActive: true,
    ),
    ApplicationModel(
      id: "4",
      profileImage: "https://randomuser.me/api/portraits/women/21.jpg",
      userName: "Anjali Patel",
      userType: "Professional",
      location: "Bengaluru",
      appliedOn: DateTime(2025, 10, 3),
      applicationStatus: "interview",
      isActive: true,
    ),
    ApplicationModel(
      id: "5",
      profileImage: "https://randomuser.me/api/portraits/men/52.jpg",
      userName: "Ravi Kumar",
      userType: "Experienced",
      location: "Pune",
      appliedOn: DateTime(2025, 9, 28),
      applicationStatus: "new",
      isActive: false,
    ),
  ];

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      state = state.copyWith(pageState: PageState.success, data: _applications);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint("❌ fetchData error: ${e.toString()}");
      showSnackBar(e.toString());
    }
  }

  void selectFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);

    if (filter.toLowerCase() == 'all') {
      state = state.copyWith(data: _applications);
    } else {
      final filtered = _applications
          .where((app) =>
      app.applicationStatus?.toLowerCase() ==
          filter.toLowerCase())
          .toList();
      state = state.copyWith(data: filtered);
    }
  }
}
