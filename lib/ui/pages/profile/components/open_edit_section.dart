import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/open_bottom_sheet.dart';
import '../../home/components/boost/profile_completion_slider.dart';
import '../edit_profile_components/edit_basic_information.dart';
import '../edit_profile_components/edit_education_info.dart';
import '../edit_profile_components/edit_location_information.dart';
import '../edit_profile_components/edit_resume.dart';
import '../edit_profile_components/edit_skill_info.dart';



class OpenEditSectionBuilder extends ConsumerStatefulWidget {
  final EmployeeProfileFieldsParams? params;

  const OpenEditSectionBuilder({super.key, this.params});

  @override
  ConsumerState<OpenEditSectionBuilder> createState() =>
      _OpenEditSectionBuilderState();
}

class _OpenEditSectionBuilderState
    extends ConsumerState<OpenEditSectionBuilder> {
  bool _opened = false; // 🔥 Prevents reopening on rebuild

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryOpenBottomSheet();
    });
  }

  void _tryOpenBottomSheet() {
    if (_opened) return; // already opened once
    if (widget.params == null) return;

    final state = ref.read(employeeProfileProvider);

    // 🔥 wait until data is loaded
    if (state.pageState == PageState.loading) return;

    _opened = true;

    final p = widget.params!;

    if (p.city == true || p.state == true) {
      openEditBottomSheet(
        context: context,
        isDraggable: true,
        content: const EditLocationInformation(isFromCommonEdit: false),
      );
    } else if (p.employeeDescription == true) {
      openEditBottomSheet(
        context: context,
        isDraggable: true,
        content: const EditBasicInformation(isFromCommonEdit: false),
      );
    } else if (p.skills == true) {
      openEditBottomSheet(
        context: context,
        isDraggable: false,
        content: const EditSkillInformation(isFromCommonEdit: false),
      );
    } else if (p.education == true) {
      openDynamicFormSheet(
        context: context,
        child: EditEducationInformation(isFromCommonEdit: false),
      );
    } else if (p.resume == true) {
      openEditBottomSheet(
        context: context,
        isDraggable: false,
        content: const EditResumeInformation(isFromCommonEdit: false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(employeeProfileProvider);

    /// When pageState changes from LOADING → SUCCESS,
    /// this rebuild will trigger `_tryOpenBottomSheet()` again.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tryOpenBottomSheet();
    });

    return const SizedBox.shrink();
  }
}
