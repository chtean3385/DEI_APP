import 'package:dei_champions/widgets/others/app_bar_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';
import 'components/add_update_post_button.dart';
import 'components/job_post_forms_view.dart';

class EditJobPostScreen extends ConsumerStatefulWidget {
  const EditJobPostScreen({super.key});

  @override
  ConsumerState<EditJobPostScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends ConsumerState<EditJobPostScreen> {
  @override
  void initState() {
    super.initState();

    /// Wait until the first frame, then fetch initial data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addEditJobProvider.notifier).fetchInitialProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(title: "Edit Job Post", titleStyleSmall: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: JobPostFormView()),
            AddUpdatePostButton(isEdit: true),
          ],
        ),
      ),
    );
  }
}
