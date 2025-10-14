import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/ui/pages/All/sections/saved_jobs/components/saved_job_card.dart';
import 'package:dei_champions/ui/pages/All/sections/saved_jobs/components/saved_jobs_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../providers/providers.dart';



class SavedJobListView  extends ConsumerWidget {
  SavedJobListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(savedJobsProvider);
    return  state.data?.isNotEmpty == true ? ListView.separated(
      itemCount: state.data?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SavedJobCard(jobModel: state.data![index],
          onTap: ()=>AppNavigator.loadJobDetailsScreen(state.data![index]),
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    ): SavedJobsEmptyScreen();
  }
}
