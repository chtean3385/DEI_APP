
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/shimmer_loader.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_styles.dart';
import '../../../../constants/enums.dart';
import '../../../../models/defense_veteran/dv_role_model.dart';

class VeteranRolesSection extends ConsumerWidget {
  const VeteranRolesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(veteranRoleSectionProvider);
    // Handle loading, error, and data states
    // return _loading();
    if (state.pageState == PageState.loading) {
      return _loading();
    }

    if (state.pageState == PageState.error) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          state.errorMessage ?? 'Something went wrong.',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    final data = state.data;
    if (data == null || data.isEmpty) {
      return const SizedBox.shrink();
    }
    final item = data.first;
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16, top: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(16),
                child: ColoredBox(
                  color:   BootstrapColors.colors["lightNavy"] ??
                      AppColors.primaryColor,
                  child: SizedBox(
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.sectionTitle ?? "",
                    style: context.textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  Text(
                    item.lead ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,fontSize: 12,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  ElevatedButton(
                    onPressed: () => openVeteranRoles(context,item),
                    child: Text(
                     'Read More',
                      style: TextStyle(
                        color: Color(0xFF1a237e),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return ShimmerLoader(
      child: Padding(
        padding: const EdgeInsets.only( bottom: 16,left: 16,right: 16),
        child:  ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: ColoredBox(
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
Future<void> openVeteranRoles(BuildContext context,VeteranRoleModel item) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(16),
              child: ColoredBox(
              color:   BootstrapColors.colors["lightNavy"] ??
                    AppColors.primaryColor,
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.sectionTitle ?? "",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),
                  Text(
                    item.lead ?? "",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8(),

                  if (item.roles != null && item.roles!.isNotEmpty)
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: List.generate(item.roles!.length, (index) {
                        final role = item.roles![index];
                        return ElevatedButton(
                          onPressed: () {
                            print('${role.name} button pressed');
                          },
                          child: Text(
                            role.name ?? '',
                            style: TextStyle(
                              color: Color(0xFF1a237e),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        );
                      }),
                    ),
                ],
              ),
            ),
          )

        ],
      );
    },
  );
}