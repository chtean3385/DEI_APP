import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/providers.dart';
import '../apply_empty.dart';
import 'applied_job_card.dart';

class AppliedJobListView  extends ConsumerWidget {
  AppliedJobListView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appliedJobsProvider);
    return  state.data?.isNotEmpty == true ? ListView.separated(
      itemCount: state.data?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AppliedJobCard(jobModel: state.data![index],
          onTap: ()=>AppNavigator.loadJobDetailsScreen(state.data![index]),
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    ): ApplyEmptyScreen();
  }
}
