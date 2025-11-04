import 'package:dei_champions/ui/pages/common_screens/components/team_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../../constants/enums.dart';
import '../../../../models/state_models/out_teeam/our_team_state.dart';
import '../../../../providers/controllers/our_team/our_team_controller.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/custom_loader.dart';
import '../../All/components/dash_board_empty.dart';

class OurTeamView extends ConsumerWidget {
  OurTeamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ourTeamProvider);
    final controller = ref.read(ourTeamProvider.notifier);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyWidget();
    } else {
      return _data(state, controller);
    }
  }

  Widget _data(OurTeamState state, OurTeamController controller) {
    return SafeArea(
      child: ListView.separated(
        itemCount: state.data!.length,
        padding: EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return OurTeamCard(
            item: state.data![index],
            onTap: () => controller.launchEmail(
              name: state.data![index].name ?? "",
              email: state.data![index].email ?? "",
            ),
          );
        },
        separatorBuilder: (c, s) =>
            Divider(color: Colors.white70, height: 12),
      ),
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 3,
      padding: EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return ShimmerOurTeamCard();
      },
      separatorBuilder: (c, s) => Divider(color: Colors.white70, height: 12),
    );
  }
}
