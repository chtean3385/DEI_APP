import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'candidate_card.dart';

class CandidatesListView extends ConsumerWidget {
  CandidatesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(candidatesListProvider);
    return state.data?.isNotEmpty == true
        ? ListView.separated(
            itemCount: state.data?.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CandidateCard(
                candidateModel: state.data![index],
                // onTap: ()=>AppNavigator.loadJobDetailsScreen(state.data![index]),
              );
            },
            separatorBuilder: (context, index) => gapH16(),
          )
        : EmptyWidget();
  }
}
