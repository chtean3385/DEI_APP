import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/enums.dart';
import '../../../models/state_models/dash_board/dash_board_state.dart';
import '../../../providers/providers.dart';
import '../../../widgets/others/animated_wrapper.dart';
import '../../../widgets/others/custom_loader.dart';
import 'components/dash_board_empty.dart';
import 'components/dashboard_item_card.dart';

class DashBoardAllScreen extends ConsumerWidget {
  DashBoardAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashBoardProvider);
    // return _shimmerLoader();
    if (state.pageState == PageState.loading) {
      return _shimmerLoader();
    } else if (state.pageState == PageState.error) {
      return SomethingWentWrong();
    } else if (state.data?.isEmpty == true) {
      return EmptyDashboardWidget();
    } else {
      return _data(state);
    }
  }

  Widget _data(DashBoardState state) {
    return AnimatedSignupWrapper(
      enableGoogleSign: false,
      child: ListView.separated(
        itemCount: state.data!.length,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) {
          return DashboardCard(item:  state.data![index]);
        },
        separatorBuilder: (c, s) => Divider(color: navigatorKey.currentContext!.colors.white70, height: 12),
      ),
    );
  }

  Widget _shimmerLoader() {
    return ListView.separated(
      itemCount: 8,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return ShimmerDashboardCard();
      },
      separatorBuilder: (c, s) => Divider(color: navigatorKey.currentContext!.colors.white70, height: 12),

    );
  }
}
