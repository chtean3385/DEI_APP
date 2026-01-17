import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../main.dart';
import '../../../../providers/providers.dart';
import '../../search/components/search_job_card.dart';

class LetsConnectContactSection extends ConsumerWidget {
  const LetsConnectContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(letsConnectProvider); // your provider
    // return _loader() ;
    if (state.pageState == PageState.loading) {
      return _loader() ;
    }
    return _content(context,ref);
  }
  Widget _loader() {
    return ShimmerLoader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ShimmerBox(height: 20, width: 100),
          const SizedBox(height: 4),
          ShimmerBox(height: 14, width: double.infinity),
          const SizedBox(height: 4),
          ShimmerBox(height: 14, width: double.infinity),
          const SizedBox(height: 4),

          ShimmerBox(height: 16, width: 200),
          const SizedBox(height: 4),

          ShimmerBox(height: 12, width: 200),
          const SizedBox(height: 4),

          ShimmerBox(height: 12, width: 200),

        ],
      ),
    );
  }
  Widget _content(BuildContext context,WidgetRef ref){
    final state = ref.watch(letsConnectProvider); // your provider
    final colorTheme = context.colors;
    final data = state.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data?.title ?? "Lets Connect",
          style: context.textTheme.bodyLarge?.copyWith(
            color: colorTheme.buttonPrimaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),

        gapH8(),

        Text(
          data?.subTitle ??
              "Email us personally or complete the form below to set up a meeting or discuss an idea.",
          style: context.textTheme.bodyMedium?.copyWith(
            color: colorTheme.black54,
          ),
        ),

        gapH8(),

        Text(
          data?.quote ?? "We will respond right away.",
          style: context.textTheme.labelMedium?.copyWith(
            color: Colors.green,
          ),
        ),

        gapH8(),

        if ((data?.contactEmail ?? '').isNotEmpty)
          _contactDetailsTile(Icons.email, data!.contactEmail!),

        if ((data?.contactEmail ?? '').isNotEmpty) gapH8(),

        if ((data?.contactNumber ?? '').isNotEmpty)
          _contactDetailsTile(Icons.phone, data!.contactNumber!),
      ],
    );
  }

  Widget _contactDetailsTile(IconData,title){
    return Row(
      children: [
        Icon(IconData, size: 15, color: navigatorKey.currentContext!.colors.buttonPrimaryColor),
        gapW16(),
        Text(
          title,
          style: navigatorKey.currentContext!.textTheme.bodyMedium?.copyWith(color: navigatorKey.currentContext!.colors.black54),
        ),
      ],
    );
  }
}
