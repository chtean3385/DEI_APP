import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/ui/pages/home/how_it_works/stepper_widget.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../main.dart';
import '../../../../models/state_models/home/how_it_works_state.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class HowItWorksSection extends ConsumerWidget {
  const HowItWorksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(howItWorksProvider);
    final hasData = (state.data ?? []).isNotEmpty;

    if (!hasData && state.pageState != PageState.loading) {
      return const SizedBox.shrink();
    }
    return state.pageState == PageState.loading
        ?_loadingUi():
    _data(state, context);

  }


  Widget _loadingUi() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24, top: 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header row
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 14, width: 100),
              ),
              const SizedBox(height: 4),
              ColoredBox(
                color: Colors.white,
                child: SizedBox(height: 10, width: 200),
              ),
              const SizedBox(height: 8),
              // horizontal list
              ShimmerHowItWorkTimeline(),
              const SizedBox(height: 8),
              CustomThemeButton(
                child: Text(
                  'Get Started',
                  style: navigatorKey.currentContext!.textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                color: Colors.transparent,
                borderColor:BootstrapColors.colors["orange"] ,
                radius: 30,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _data(HowItWorkState state, BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 0),
      child: ColoredBox(
        color: BootstrapColors.colors["navy"] ?? Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header row
              Text(
                state.data?.first.heading ?? "",
                style: theme.titleMedium?.copyWith(color: Colors.white),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                state.data?.first.subheading ?? "",
                maxLines: 2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: theme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 8),
              // horizontal list
              _dataItems(state),
              const SizedBox(height: 8),
              CustomThemeButton(
                child: Text(
                  'Get Started',
                  style: navigatorKey.currentContext!.textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                color: Colors.transparent,
                borderColor:BootstrapColors.colors["orange"] ,
                radius: 30,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _dataItems(HowItWorkState state) {

    return (state.data?.first.howItsWorks?.length ?? 0) > 0
        ?HowItWorkTimeline(howItWork: state.data?.first.howItsWorks ?? [],)
        : SizedBox.shrink();
  }
}