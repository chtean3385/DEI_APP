import 'package:dei_champions/service/common/common_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../widgets/others/snack_bar.dart';

class LetsConnectController extends StateNotifier<PageState> {
  final Ref ref;

  LetsConnectController(this.ref) : super(PageState.initial) {}

  final CommonService _service =
  CommonService();
  final formKey = GlobalKey<FormState>();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final countryFocus = FocusNode();

  /// basic info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final organisationController = TextEditingController();
  final designationController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final descriptionController = TextEditingController();
  final interestController = TextEditingController();

  @override
  void dispose() {
    debugPrint("🔥 LetsConnectController disposed");
    firstNameController.dispose();
    lastNameController.dispose();
    organisationController.dispose();
    designationController.dispose();
    emailController.dispose();
    mobileController.dispose();
    descriptionController.dispose();
    interestController.dispose();
    super.dispose();
  }

  /// 🔹 Call this to update chef details
  Future<void> updateEmployeeProfileDetails(
    BuildContext context, {
    bool isFromCommonEdit = true,
  }) async {
    if (isFromCommonEdit) {
      if (!(formKey.currentState?.validate() ?? false)) {
        showSnackBar("Please fill all required fields");
        return;
      }
    }

    state = PageState.loading;
    print('--- LetsConnectController stattteee ---');
    print('firstNameController: ${firstNameController.text}');
    print('lastNameController: ${lastNameController.text}');
    print('organisationController: ${organisationController.text}');
    print('designationController: ${designationController.text}');
    print('emailController: ${emailController.text}');
    print('Mobile: ${mobileController.text}');
    print('Description: ${descriptionController.text}');
    print('interestController: ${interestController.text}');
    try {
      await Future.delayed(Duration(seconds: 2));
      // final updateData = EmployeeUserModel(
      //   name: nameController.text.trim(),
      //   email: emailController.text.trim(),
      //   mobile: mobileController.text.trim(),
      //   dateOfBirth: dobController.text.trim(),
      //   employeeDescription: descriptionController.text.trim(),
      //   gender: state.profileData?.gender,
      //   // assuming selected via dropdown
      //   workStatus: state.profileData?.workStatus,
      //   jobType: state.profileData?.jobType,
      //   department: state.profileData?.department,
      //   // keep existing if not changed
      //   category: state.profileData?.category,
      //   salaryRange: state.profileData?.salaryRange,
      //   preferredLocations: state.profileData?.preferredLocations,
      //   skills: state.profileData?.skills,
      // );
      // final BaseModel result = await _service
      //     .letsConnect(
      //
      //     );
      // showSnackBar(result.message, duration: 2);
      state = PageState.success;
      Navigator.pop(context);
    } catch (e) {
      state = PageState.error;
      showSnackBar(e.toString());
      debugPrint("catch - updateEmployeeProfileDetails");
      debugPrint(e.toString());
    }
  }

}
