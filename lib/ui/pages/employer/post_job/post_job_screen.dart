import 'package:flutter/material.dart';

import 'components/add_update_post_button.dart';
import 'components/job_post_forms_view.dart';

class PostJobScreen extends StatelessWidget {
  const PostJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: JobPostFormView()),
        AddUpdatePostButton()
      ],
    );
  }

}
