import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employer_application_card.dart';


class JobApplicants  extends ConsumerWidget {
  JobApplicants({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employerApplicationsProvider);
    return  state.data?.isNotEmpty == true ? ListView.separated(
      itemCount: state.data?.length ?? 0,
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return EmployerApplicationCard(
           item: state.data![index],
        );
      },
      separatorBuilder: (context, index) => gapH16(),
    ): EmptyWidget(text: "No Applications Found",);
  }
}
