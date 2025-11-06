import 'package:dei_champions/constants/enums.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/others/rounded_network_image.dart';
import '../../search/components/search_job_card.dart';

class BasicDetails extends ConsumerWidget {
  const BasicDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return _loader();
    final state = ref.watch(employeeProfileProvider);
    String? employeeCurrentPosition =
        (state.profileData?.experience != null &&
            state.profileData?.experience?.isNotEmpty == true)
        ? state.profileData?.experience!.last.position
        : null;
    return state.pageState == PageState.loading
        ? _loader()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state.profileData?.profilePhotoUrl?.isNotEmpty == true
                    ? RoundedNetworkImage(
                        imageUrl: state.profileData!.profilePhotoUrl!,
                        width: 100,
                        height: 100,
                        borderRadius: 50,
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black12,
                        child: Icon(
                          Icons.person_add, // ✅ Add Profile Image icon
                          size: 30, // optional: adjust size
                          color: Colors.grey.shade600, // optional: adjust color
                        ),
                      ),
                const SizedBox(height: 8),
                Text(
                  state.profileData?.name ?? "",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  employeeCurrentPosition ?? "Profession not specified",
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          );
  }

  Widget _loader() {
    return ShimmerLoader(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 30, backgroundColor: Colors.white),
            const SizedBox(height: 8),
            ShimmerBox(height: 20, width: 200),
            const SizedBox(height: 4),
            ShimmerBox(height: 14, width: 100),
          ],
        ),
      ),
    );
  }
}
