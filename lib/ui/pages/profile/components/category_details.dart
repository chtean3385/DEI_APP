import 'package:dei_champions/constants/app_theme.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/enums.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/others/shimmer_loader.dart';
import '../../search/components/search_job_card.dart';

class CategoryDetails extends ConsumerWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeProfileProvider);
    final colorTheme = context.colors;

    if (state.pageState == PageState.loading) {
      return _loader();
    }

    final categories = state.profileData?.industry ?? [];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorTheme.jobCardBgColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: colorTheme.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          /// ✅ Dynamic category list
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: categories.map(
                  (item) => _CategoryItem(
                title: item.title ?? "",
                imageUrl: item.image,
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
  Widget _loader() {
    return ShimmerLoader(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title shimmer
            ShimmerBox(height: 14, width: 120),
            const SizedBox(height: 12),

            /// Wrap shimmer chips
            Wrap(
              spacing: 16,
              runSpacing: 12,
              children: List.generate(
                6,
                    (_) => _categoryChipLoader(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryChipLoader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Icon shimmer
        ShimmerBox(
          height: 16,
          width: 16,
          radius: 4,
        ),
        const SizedBox(width: 6),

        /// Text shimmer (vary width for realism)
        ShimmerBox(
          height: 12,
          width: 60 + (20 * (DateTime.now().millisecond % 2)),
          radius: 4,
        ),
      ],
    );
  }

}
class _CategoryItem extends StatelessWidget {
  final String title;
  final String? imageUrl;

  const _CategoryItem({
    required this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (imageUrl != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              imageUrl!,
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            title,
            style: context.textTheme.displaySmall?.copyWith(
                color: context.colors.black54,fontSize: 13
            ),
            softWrap: true,textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
