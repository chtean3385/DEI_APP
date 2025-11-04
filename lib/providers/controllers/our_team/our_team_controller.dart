import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/snack_bar.dart';
import '../../../models/common/team_member_model.dart';
import '../../../models/state_models/out_teeam/our_team_state.dart';
import '../../../service/common/common_service.dart';
import 'package:url_launcher/url_launcher.dart';


class OurTeamController extends StateNotifier<OurTeamState> {
  final Ref _ref;
  final CommonService _service = CommonService();

  OurTeamController(this._ref) : super(OurTeamState.initial()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(pageState: PageState.loading);
    try {
      final result = await _service.getOurTeamData();
      final Data = (result.data as List)
          .map((e) => TeamMemberModel.fromJson(e))
          .toList();
      state = state.copyWith(pageState: PageState.success, data: Data);
    } catch (e) {
      state = state.copyWith(
        pageState: PageState.error,
        errorMessage: e.toString(),
      );
      debugPrint(" catch OurTeamController fetchData -${e.toString()}");
      showSnackBar(e.toString());
    }
  }

  Future<void> launchEmail({required String name, required String email}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Hello $name & body=Hi $name,'),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      debugPrint('Could not launch email app for $email');
    }
  }
}
