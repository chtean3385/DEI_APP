import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_strings.dart';
import 'package:dei_champions/models/lets_connect/lets_connect_model.dart';
import 'package:dei_champions/service/common/common_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/common/base_model.dart';
import '../../../models/profile/employee_user_model/employee_user_model.dart';
import '../../../models/state_models/lets_connect/lets_connect_state.dart';
import '../../../models/state_models/profile/employee_profile_state.dart';
import '../../../widgets/others/snack_bar.dart';
import '../../providers.dart';

class LetsConnectController extends StateNotifier<LetsConnectState> {
  final Ref ref;

  LetsConnectController(this.ref) : super(LetsConnectState.initial()) {
    debugPrint('🚀 LetsConnectController constructor called');
    getLetsConnectContactDetails();
    init();
  }

  void init() {
    debugPrint('🟡 init() called');

    /// 1️⃣ FILL IMMEDIATELY if already loaded
    final current = ref.read(drawerProfileProvider);
    debugPrint('⚡ Current profile at init: ${current.profileData}');

    if (current.profileData != null) {
      debugPrint('✅ Filling from existing state');
      _fillProfile(current.profileData!);
    }

    /// 2️⃣ Listen for future updates
    ref.listen<EmployeeProfileState>(
      drawerProfileProvider,
          (previous, next) {
        debugPrint('🟢 drawerProfileProvider changed');
        debugPrint('Next profile: ${next.profileData}');

        if (next.profileData != null) {
          _fillProfile(next.profileData!);
        }
      },
    );
  }



  final CommonService _service = CommonService();
  final formKey = GlobalKey<FormState>();
  final stateFocus = FocusNode();
  final cityFocus = FocusNode();
  final countryFocus = FocusNode();

  /// basic info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final descriptionController = TextEditingController();
  final interestController = TextEditingController();

  @override
  void dispose() {
    debugPrint("🔥 LetsConnectController disposed");
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    descriptionController.dispose();
    interestController.dispose();
    super.dispose();
  }


  void _fillProfile(EmployeeUserModel profile) {
    /// Name split (safe)
    final nameParts = profile.name?.split(' ') ?? [];

    firstNameController.text =
    nameParts.isNotEmpty ? nameParts.first :  profile.name ?? '';

    lastNameController.text =
    nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    emailController.text = profile.email ?? '';
    mobileController.text = profile.mobile ?? '';
  }

  /// 🔹 Call this to update chef details
  Future<void> sendLetsConnectRequest(BuildContext context,{bool isGuest = false}) async {
    if (!(formKey.currentState?.validate() ?? false)) {
      showSnackBar("Please fill all required fields");
      return;
    }
    state = state.copyWith(submitPageState: PageState.loading);
    print('--- LetsConnectController stattteee ---');
    print('firstNameController: ${firstNameController.text}');
    print('lastNameController: ${lastNameController.text}');
    print('emailController: ${emailController.text}');
    print('Mobile: ${mobileController.text}');
    print('Description: ${descriptionController.text}');
    print('interestController: ${interestController.text}');
    final matchedInterestValue =
        AppStrings.inquiryOptions.firstWhere(
              (e) =>
                  e["label"]?.toLowerCase() ==
                  interestController.text.toLowerCase(),
              orElse: () => {"value": ""}, // fallback!
            )["value"]
            as String;

    try {
      final BaseModel result = await _service.letsConnect(
        email: emailController.text,
        phone: mobileController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        query: descriptionController.text,
        interest: matchedInterestValue,
      );
      state = state.copyWith(submitPageState: PageState.success);


      /// 🔥 Show custom success popup
      _showAutoCloseSuccessDialog(
        context,
        result.message,
          isGuest: isGuest
      );
    } catch (e) {
      if(!mounted) return;
      state = state.copyWith(submitPageState: PageState.error);
      showSnackBar(e.toString());
      debugPrint("catch - updateEmployeeProfileDetails");
      debugPrint(e.toString());
    }
  }
  /// 🔹 Call this to employee profile  data from API call
  Future<void> getLetsConnectContactDetails() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final BaseModel result = await _service.getLetsConnectData();
      // 🔹 Validate data type
      if (result.data == null) {
         Exception('LetsConnect data is null');
      }

      if (result.data is! List) {
         Exception('LetsConnect data is not a list');
      }

      final List list = result.data as List;

      // 🔹 Handle empty list
      if (list.isEmpty) {
         Exception('LetsConnect data list is empty');
      }

      // 🔹 Take first item safely
      final LetsConnectModel letsConnectModel =
      LetsConnectModel.fromJson(list.first as Map<String, dynamic>);


      state = state.copyWith(
        pageState: PageState.success,
        data: letsConnectModel,
      );
      debugPrint("success - ${letsConnectModel.title}");
      debugPrint("success - getLetsConnectContactDetails");
    } catch (e) {
      state = state.copyWith(pageState: PageState.error);
      debugPrint("catch - getLetsConnectContactDetails");
      debugPrint(e.toString());
    }
  }
}

void _showAutoCloseSuccessDialog(BuildContext context, String message,{bool isGuest= false}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 12),
            Text(
              "Success",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  );

  /// ⏳ Close automatically after 4 seconds and go to Home screen
  Future.delayed(const Duration(seconds: 3), () {
    Navigator.pop(context); // close dialog
    AppNavigator.toBottomBar(isGuest: isGuest);
  });


}
