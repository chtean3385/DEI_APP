import 'package:dei_champions/constants/app_styles.dart';
import 'package:dei_champions/models/common/price_plan_model.dart';
import 'package:dei_champions/providers/providers.dart';
import 'package:dei_champions/widgets/others/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/enums.dart';
import '../../../../widgets/others/custom_theme_button.dart';

class PlanPriceCard extends StatelessWidget {
  final PricingPlanModel item;

  const PlanPriceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      color: Colors.white,
      shadowColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name ?? "", style: theme.labelMedium),
            gapH16(),
            RichText(
              text: TextSpan(
                text: item.price != null && item.price != 0
                    ? "₹${item.price.toString()}"
                    : "Free",
                style: theme.headlineMedium?.copyWith(
                  color: AppColors.primaryColor,
                ),
                children: [
                  TextSpan(
                    text: "/",
                    style: theme.displaySmall?.copyWith(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: item.billingCycle ?? "",
                    style: theme.bodyMedium?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            gapH16(),

            Text(
              item.description ?? "",
              style: theme.labelMedium,
              textAlign: TextAlign.left,
            ),
            gapH16(),
            Divider(color: Colors.black54, thickness: .5),
            gapH16(),
            FeatureListWidget(features: item.features),
            gapH16(),
            _submit(
              (item.price != null && item.price != 0)
                  ? "Choose Plan"
                  : "Get Started",
            ),
          ],
        ),
      ),
    );
  }

  Widget _submit(String title) {
    return Consumer(
      builder: (context, ref, _) {
        final isLoading = ref.watch(planPriceProvider) == PageState.loading;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomThemeButton(
            isExpanded: false,
            onTap: null,
            isLoading: isLoading,
            padding: isLoading
                ? const EdgeInsets.symmetric(horizontal: 50, vertical: 12)
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),

            radius: 30,
            color: AppColors.primaryColor,
            borderColor: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}

class FeatureListWidget extends StatelessWidget {
  final List<String>? features;

  const FeatureListWidget({super.key, this.features});

  @override
  Widget build(BuildContext context) {
    if (features == null || features!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features!.map((feature) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: .2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  feature,
                  textAlign: TextAlign.left,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
